require 'test_helper'

class DamageTypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:damage_types)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_damage_type
    assert_difference('DamageType.count') do
      post :create, :damage_type => { }
    end

    assert_redirected_to damage_type_path(assigns(:damage_type))
  end

  def test_should_show_damage_type
    get :show, :id => damage_types(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => damage_types(:one).id
    assert_response :success
  end

  def test_should_update_damage_type
    put :update, :id => damage_types(:one).id, :damage_type => { }
    assert_redirected_to damage_type_path(assigns(:damage_type))
  end

  def test_should_destroy_damage_type
    assert_difference('DamageType.count', -1) do
      delete :destroy, :id => damage_types(:one).id
    end

    assert_redirected_to damage_types_path
  end
end
