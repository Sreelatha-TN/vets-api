# frozen_string_literal: true

require 'sm/client'

class SMController < VetsApiController
  include ActionController::Serialization
  include MHVControllerConcerns

  protected

  def client
    @client ||= SM::Client.new(session: { user_id: current_user.mhv_correlation_id })
  end

  def authorize
    raise_access_denied unless current_user.authorize(:mhv_messaging, :access?)
  end

  def raise_access_denied
    raise Common::Exceptions::Forbidden, detail: 'You do not have access to messaging'
  end
end
