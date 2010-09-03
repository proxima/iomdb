require 'test_helper'

class WeaponDamageLevelsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:weapon_damage_levels)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_weapon_damage_level
    assert_difference('WeaponDamageLevel.count') do
      post :create, :weapon_damage_level => { }
    end

    assert_redirected_to weapon_damage_level_path(assigns(:weapon_damage_level))
  end

  def test_should_show_weapon_damage_level
    get :show, :id => weapon_damage_levels(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => weapon_damage_levels(:one).id
    assert_response :success
  end

  def test_should_update_weapon_damage_level
    put :update, :id => weapon_damage_levels(:one).id, :weapon_damage_level => { }
    assert_redirected_to weapon_damage_level_path(assigns(:weapon_damage_level))
  end

  def test_should_destroy_weapon_damage_level
    assert_difference('WeaponDamageLevel.count', -1) do
      delete :destroy, :id => weapon_damage_levels(:one).id
    end

    assert_redirected_to weapon_damage_levels_path
  end
end
