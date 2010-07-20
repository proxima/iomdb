require 'test_helper'

class DamageLevelsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:damage_levels)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_damage_level
    assert_difference('DamageLevel.count') do
      post :create, :damage_level => { }
    end

    assert_redirected_to damage_level_path(assigns(:damage_level))
  end

  def test_should_show_damage_level
    get :show, :id => damage_levels(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => damage_levels(:one).id
    assert_response :success
  end

  def test_should_update_damage_level
    put :update, :id => damage_levels(:one).id, :damage_level => { }
    assert_redirected_to damage_level_path(assigns(:damage_level))
  end

  def test_should_destroy_damage_level
    assert_difference('DamageLevel.count', -1) do
      delete :destroy, :id => damage_levels(:one).id
    end

    assert_redirected_to damage_levels_path
  end
end
