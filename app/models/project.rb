# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :conversation_entries, dependent: :destroy
  validates :name, presence: true

  STATUSES = { pending: 0, in_progress: 1, completed: 2 }.freeze

  enum status: STATUSES

  def conversation_history
    conversation_entries.order(:created_at)
  end
end
