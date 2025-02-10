# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user is valid' do
    let(:user) { build(:user) }

    it 'is valid' do
      expect(user).to be_valid
    end
  end

  context 'user is invalid' do
    let(:user) { build(:user, email: nil) }

    it 'is invalid' do
      expect(user).to_not be_valid
    end
  end
end
