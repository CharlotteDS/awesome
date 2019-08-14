class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string
    add_column :users, :is_admin, :boolean, default: false
  end
end
