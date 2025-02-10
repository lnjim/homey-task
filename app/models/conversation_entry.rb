# frozen_string_literal: true

class ConversationEntry < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
