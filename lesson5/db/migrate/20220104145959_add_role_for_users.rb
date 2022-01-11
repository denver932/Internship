# frozen_string_literal: true

class AddRoleForUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :integer, null: false, default: false
    add_index :users, :role
  end
end
