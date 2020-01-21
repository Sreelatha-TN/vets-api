# frozen_string_literal: true

module HCA
  class SubmissionJob
    include Sidekiq::Worker

    sidekiq_retries_exhausted do |msg, _e|
      health_care_application = HealthCareApplication.find(msg['args'][2])
      health_care_application.update_attributes!(
        state: 'failed',
        form: msg['args'][1].to_json,
        google_analytics_client_id: msg['args'][3]
      )
    end

    def perform(user_identifier, form, health_care_application_id, google_analytics_client_id)
      health_care_application = HealthCareApplication.find(health_care_application_id)

      begin
        result = HCA::Service.new(user_identifier).submit_form(form)
      rescue HCA::SOAPParser::ValidationError, Aws::S3::Errors::NotFound => e
        PersonalInformationLog.create!(data: { form: form }, error_class: e.class.to_s)

        return health_care_application.update_attributes!(
          state: 'failed',
          form: form.to_json,
          google_analytics_client_id: google_analytics_client_id
        )
      rescue
        health_care_application.update_attributes!(state: 'error')
        raise
      end

      Rails.logger.info "SubmissionID=#{result[:formSubmissionId]}"

      health_care_application.set_result_on_success!(result)
    end
  end
end
