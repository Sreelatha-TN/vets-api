# frozen_string_literal: true

module V0
  # Application for the Program of Comprehensive Assistance for Family Caregivers (Form 10-10CG)
  class CaregiversAssistanceClaimsController < ApplicationController
    skip_before_action(:authenticate)

    def create
      claim = SavedClaim::CaregiversAssistanceClaim.new(claim_params)
      claim.valid? || raise(Common::Exceptions::ValidationErrors, claim)

      submission = service.submit_claim!(claim)

      render json: submission, serializer: ::Form1010cg::SubmissionSerializer
    end

    private

    def service
      @service ||= ::Form1010cg::Service.new
    end

    def claim_params
      params.require(:caregivers_assistance_claim).permit(:form)
    end
  end
end
