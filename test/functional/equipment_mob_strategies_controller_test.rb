require 'test_helper'

class EquipmentMobStrategiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment_mob_strategies)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_equipment_mob_strategy
    assert_difference('EquipmentMobStrategy.count') do
      post :create, :equipment_mob_strategy => { }
    end

    assert_redirected_to equipment_mob_strategy_path(assigns(:equipment_mob_strategy))
  end

  def test_should_show_equipment_mob_strategy
    get :show, :id => equipment_mob_strategies(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => equipment_mob_strategies(:one).id
    assert_response :success
  end

  def test_should_update_equipment_mob_strategy
    put :update, :id => equipment_mob_strategies(:one).id, :equipment_mob_strategy => { }
    assert_redirected_to equipment_mob_strategy_path(assigns(:equipment_mob_strategy))
  end

  def test_should_destroy_equipment_mob_strategy
    assert_difference('EquipmentMobStrategy.count', -1) do
      delete :destroy, :id => equipment_mob_strategies(:one).id
    end

    assert_redirected_to equipment_mob_strategies_path
  end
end
