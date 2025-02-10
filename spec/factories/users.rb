# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'qwertyuiop' }
  end

  factory :project_owner, parent: :user do
    email { 'project.owner@test.com' }
  end
end
