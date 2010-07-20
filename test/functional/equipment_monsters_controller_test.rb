require 'test_helper'

class EquipmentMonstersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment_monsters)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_equipment_monster
    assert_difference('EquipmentMonster.count') do
      post :create, :equipment_monster => { }
    end

    assert_redirected_to equipment_monster_path(assigns(:equipment_monster))
  end

  def test_should_show_equipment_monster
    get :show, :id => equipment_monsters(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => equipment_monsters(:one).id
    assert_response :success
  end

  def test_should_update_equipment_monster
    put :update, :id => equipment_monsters(:one).id, :equipment_monster => { }
    assert_redirected_to equipment_monster_path(assigns(:equipment_monster))
  end

  def test_should_destroy_equipment_monster
    assert_difference('EquipmentMonster.count', -1) do
      delete :destroy, :id => equipment_monsters(:one).id
    end

    assert_redirected_to equipment_monsters_path
  end
end
