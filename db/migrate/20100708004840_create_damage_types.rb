class CreateDamageTypes < ActiveRecord::Migration
  def self.up
    create_table :damage_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :damage_types
  end
end
