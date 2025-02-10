# frozen_string_literal: true

FactoryBot.define do
  factory :status_history do
    association :user, factory: :user
    association :project, factory: :project
    status { 0 }
  end
end
