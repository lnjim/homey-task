# frozen_string_literal: true

FactoryBot.define do
  factory :conversation_entry do
    project { nil }
    user { nil }
    type { '' }
    content { 'MyText' }
    status { 1 }
  end
end
