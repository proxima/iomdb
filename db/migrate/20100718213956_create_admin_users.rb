class CreateAdminUsers < ActiveRecord::Migration
  def self.up
    create_table :admin_users do |t|
      t.column :login, :string
      t.column :hashed_password, :string
      t.column :email, :string
      t.column :salt, :string
      t.column :created_at, :datetime
    end    
  end

  def self.down
    drop_table :admin_users
  end
end
