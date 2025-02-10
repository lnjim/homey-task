# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatusHistory, type: :model do
  context 'status_history is valid' do
    let(:status_history) { build(:status_history) }

    it 'is valid' do
      expect(status_history).to be_valid
    end
  end

  context 'status_history is invalid' do
    let(:status_history) { build(:status_history, status: nil) }

    it 'is invalid' do
      expect(status_history).to_not be_valid
    end
  end
end
