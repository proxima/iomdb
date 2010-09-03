require 'test_helper'

class WeaponDamageAffectsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:weapon_damage_affects)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_weapon_damage_affect
    assert_difference('WeaponDamageAffect.count') do
      post :create, :weapon_damage_affect => { }
    end

    assert_redirected_to weapon_damage_affect_path(assigns(:weapon_damage_affect))
  end

  def test_should_show_weapon_damage_affect
    get :show, :id => weapon_damage_affects(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => weapon_damage_affects(:one).id
    assert_response :success
  end

  def test_should_update_weapon_damage_affect
    put :update, :id => weapon_damage_affects(:one).id, :weapon_damage_affect => { }
    assert_redirected_to weapon_damage_affect_path(assigns(:weapon_damage_affect))
  end

  def test_should_destroy_weapon_damage_affect
    assert_difference('WeaponDamageAffect.count', -1) do
      delete :destroy, :id => weapon_damage_affects(:one).id
    end

    assert_redirected_to weapon_damage_affects_path
  end
end
