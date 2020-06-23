# frozen_string_literal: true

require 'fakeredis/rspec'
require 'support/mvi/stub_mvi'
require 'support/spec_builders'
require 'support/matchers'
require 'support/spool_helpers'
require 'support/fixture_helpers'
require 'support/spec_temp_files'
require 'support/silence_stream'
require 'sidekiq-pro' if Gem.loaded_specs.key?('sidekiq-pro')
require 'support/sidekiq/batch'
require 'support/stub_emis'
require 'support/stub_evss_pciu'
require 'support/vet360/stub_vet360'
require 'support/okta_users_helpers'
require 'support/poa_stub'
require 'pundit/rspec'

# By default run SimpleCov, but allow an environment variable to disable.
unless ENV['NOCOVERAGE']
  require 'simplecov'

  SimpleCov.start 'rails' do
    track_files '**/{app,lib}/**/*.rb'

    add_filter 'app/controllers/concerns/accountable.rb'
    add_filter 'config/initializers/clamscan.rb'
    add_filter 'lib/bip_claims/configuration.rb'
    add_filter 'lib/config_helper.rb'
    add_filter 'lib/feature_flipper.rb'
    add_filter 'lib/gibft/configuration.rb'
    add_filter 'lib/ihub/appointments/response.rb'
    add_filter 'lib/salesforce/configuration.rb'
    add_filter 'lib/search/response.rb'
    add_filter 'lib/vet360/address_validation/configuration.rb'
    add_filter 'lib/vet360/exceptions/builder.rb'
    add_filter 'lib/vet360/response.rb'
    add_filter 'modules/claims_api/app/controllers/claims_api/v0/forms/disability_compensation_controller.rb'
    add_filter 'modules/claims_api/app/controllers/claims_api/v1/forms/disability_compensation_controller.rb'
    add_filter 'modules/claims_api/app/swagger/*'
    add_filter 'modules/claims_api/lib/claims_api/health_checker.rb'
    add_filter 'modules/va_facilities/lib/va_facilities/engine.rb'
    add_filter 'version.rb'

    add_group 'AppealsApi', 'modules/appeals_api/'
    add_group 'ClaimsApi', 'modules/claims_api/'
    add_group 'OpenidAuth', 'modules/openid_auth/'
    add_group 'OpenidAuth', 'modules/openid_auth/'
    add_group 'Policies', 'app/policies'
    add_group 'Serializers', 'app/serializers'
    add_group 'Services', 'app/services'
    add_group 'Swagger', 'app/swagger'
    add_group 'Uploaders', 'app/uploaders'
    add_group 'VAFacilities', 'modules/va_facilities/'
    add_group 'VAOS', 'modules/vaos/'
    add_group 'VBADocuments', 'modules/vba_documents/'
    add_group 'Veteran', 'modules/veteran/'
    add_group 'VeteranVerification', 'modules/veteran_verification/'
    SimpleCov.minimum_coverage_by_file 90
    SimpleCov.refuse_coverage_drop
  end
end

RSpec.configure do |config|
  config.order = :random

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.example_status_persistence_file_path = 'tmp/specs.txt'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include SpecBuilders
  config.include SpoolHelpers
  config.include FixtureHelpers

  config.around(:example, :run_at) do |example|
    Timecop.freeze(Time.zone.parse(example.metadata[:run_at]))
    example.run
    Timecop.return
  end

  # enable `allow_forgery_protection` in Lighthouse specs to ensure that the endpoints
  # in those modules have explicitly skipped the CSRF protection functionality
  lighthouse_dirs = %r{
    modules/
    (appeals_api|claims_api|openid_auth|va_facilities|va_forms|vba_documents|
      veteran|veteran_confirmation|veteran_verification)/
  }x
  config.define_derived_metadata(file_path: lighthouse_dirs) do |metadata|
    metadata[:enable_csrf_protection] = true
  end

  config.before(:all, :enable_csrf_protection) do
    @original_allow_forgery_protection = ActionController::Base.allow_forgery_protection
    ActionController::Base.allow_forgery_protection = true
  end

  config.after(:all, :enable_csrf_protection) do
    ActionController::Base.allow_forgery_protection = @original_allow_forgery_protection
  end
end
