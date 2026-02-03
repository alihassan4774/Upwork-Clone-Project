class RemoveRolesFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :roles, :string
  end
end
