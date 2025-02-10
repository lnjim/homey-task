# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    owner { nil }
    name { 'MyString' }
    status { 1 }
  end
end
