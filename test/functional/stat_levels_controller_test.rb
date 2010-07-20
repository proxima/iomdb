require 'test_helper'

class StatLevelsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:stat_levels)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_stat_level
    assert_difference('StatLevel.count') do
      post :create, :stat_level => { }
    end

    assert_redirected_to stat_level_path(assigns(:stat_level))
  end

  def test_should_show_stat_level
    get :show, :id => stat_levels(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => stat_levels(:one).id
    assert_response :success
  end

  def test_should_update_stat_level
    put :update, :id => stat_levels(:one).id, :stat_level => { }
    assert_redirected_to stat_level_path(assigns(:stat_level))
  end

  def test_should_destroy_stat_level
    assert_difference('StatLevel.count', -1) do
      delete :destroy, :id => stat_levels(:one).id
    end

    assert_redirected_to stat_levels_path
  end
end
