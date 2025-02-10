# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  STATUSES = { pending: 0, in_progress: 1, completed: 2 }.freeze

  enum status: STATUSES
end
