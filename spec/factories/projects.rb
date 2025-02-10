# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    association :owner, factory: :project_owner
    name { 'FactoryBot Project' }
    status { 0 }
  end
end
