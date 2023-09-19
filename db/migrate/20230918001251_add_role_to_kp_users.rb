class AddRoleToKpUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :kp_users, :role, :integer, default: 0
  end
end
