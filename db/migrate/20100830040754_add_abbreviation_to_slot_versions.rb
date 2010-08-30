class AddAbbreviationToSlotVersions < ActiveRecord::Migration
  def self.up
    add_column :slot_versions, :abbreviation, :string
  end

  def self.down
    remove_column :slot_versions, :abbreviation
  end
end
