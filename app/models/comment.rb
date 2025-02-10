# frozen_string_literal: true

class Comment < ConversationEntry
  validates :content, presence: true

  def display_entry
    "#{user.email} commented: #{content}"
  end
end
