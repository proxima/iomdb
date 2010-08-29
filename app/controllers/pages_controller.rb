class PagesController < ApplicationController

  def index
    @new_pieces = EquipmentPiece.find(:all, :conditions => ['created_at > ?', 7.days.ago], :order => 'created_at DESC, name ASC')
    @updated_pieces = EquipmentPiece.find(:all, :conditions => ['updated_at > ?', 7.days.ago], :order => 'updated_at DESC, name ASC')

    @new_mobs = EquipmentMonster.find(:all, :conditions => ['created_at > ?', 7.days.ago], :order => 'created_at DESC, name ASC')
    @updated_mobs = EquipmentMonster.find(:all, :conditions => ['updated_at > ?', 7.days.ago], :order => 'updated_at DESC, name ASC')

    @updated_pieces.delete_if{|x| x.created_at == x.updated_at}
    @updated_mobs.delete_if{|x| x.created_at == x.updated_at}
  end

end
