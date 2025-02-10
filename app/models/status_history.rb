# frozen_string_literal: true

class StatusHistory < ConversationEntry
  validates :status, presence: true

  STATUSES = { pending: 0, in_progress: 1, completed: 2 }.freeze

  enum status: STATUSES

  def display_entry
    "#{user.email} changed status to #{status.humanize}"
  end
end
