# frozen_string_literal: true

require 'rails_helper'

describe AppealsApi::V1::DecisionReviews::HigherLevelReviews::ContestableIssuesController, type: :request do
  describe '#index' do
    it 'GETs contestable_issues from Caseflow successfully' do
      VCR.use_cassette('caseflow/higher_level_reviews/contestable_issues') do
        get(
          '/services/appeals/v1/decision_reviews/higher_level_reviews/contestable_issues/compensation',
          headers: {
            'X-VA-SSN' => '872958715',
            'X-VA-Receipt-Date' => '2019-12-01'
          }
        )
        expect(response).to have_http_status(:ok)
        json = JSON.parse(response.body)
        expect(json['data']).not_to be nil
      end
    end
  end
end
