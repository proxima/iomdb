class AddAbbreviationToSlots < ActiveRecord::Migration
  def self.up
    add_column :slots, :abbreviation, :string
  end

  def self.down
    remove_column :slots, :abbreviation
  end
end
