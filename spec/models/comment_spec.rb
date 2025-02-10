# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'comment is valid' do
    let(:comment) { build(:comment) }

    it 'is valid' do
      expect(comment).to be_valid
    end
  end

  context 'comment is invalid' do
    let(:comment) { build(:comment, content: nil) }

    it 'is invalid' do
      expect(comment).to_not be_valid
    end
  end
end
