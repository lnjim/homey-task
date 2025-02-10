# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :user, factory: :user
    association :project, factory: :project
    content { 'FactoryBot Comment' }
  end
end
