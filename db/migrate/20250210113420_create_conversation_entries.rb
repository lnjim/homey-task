# frozen_string_literal: true

class CreateConversationEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :conversation_entries do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :type, null: false
      t.text :content
      t.integer :status

      t.timestamps
    end
  end
end
