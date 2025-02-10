# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'project is valid' do
    let(:project) { build(:project) }

    it 'is valid' do
      expect(project).to be_valid
    end
  end

  context 'project is invalid' do
    let(:project) { build(:project, name: nil) }

    it 'is invalid' do
      expect(project).to_not be_valid
    end
  end
end
