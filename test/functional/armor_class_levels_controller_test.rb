require 'test_helper'

class ArmorClassLevelsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:armor_class_levels)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_armor_class_level
    assert_difference('ArmorClassLevel.count') do
      post :create, :armor_class_level => { }
    end

    assert_redirected_to armor_class_level_path(assigns(:armor_class_level))
  end

  def test_should_show_armor_class_level
    get :show, :id => armor_class_levels(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => armor_class_levels(:one).id
    assert_response :success
  end

  def test_should_update_armor_class_level
    put :update, :id => armor_class_levels(:one).id, :armor_class_level => { }
    assert_redirected_to armor_class_level_path(assigns(:armor_class_level))
  end

  def test_should_destroy_armor_class_level
    assert_difference('ArmorClassLevel.count', -1) do
      delete :destroy, :id => armor_class_levels(:one).id
    end

    assert_redirected_to armor_class_levels_path
  end
end
