require 'test_helper'

class HungerLevelsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:hunger_levels)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_hunger_level
    assert_difference('HungerLevel.count') do
      post :create, :hunger_level => { }
    end

    assert_redirected_to hunger_level_path(assigns(:hunger_level))
  end

  def test_should_show_hunger_level
    get :show, :id => hunger_levels(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => hunger_levels(:one).id
    assert_response :success
  end

  def test_should_update_hunger_level
    put :update, :id => hunger_levels(:one).id, :hunger_level => { }
    assert_redirected_to hunger_level_path(assigns(:hunger_level))
  end

  def test_should_destroy_hunger_level
    assert_difference('HungerLevel.count', -1) do
      delete :destroy, :id => hunger_levels(:one).id
    end

    assert_redirected_to hunger_levels_path
  end
end
