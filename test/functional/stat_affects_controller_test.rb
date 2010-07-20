require 'test_helper'

class StatAffectsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:stat_affects)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_stat_affect
    assert_difference('StatAffect.count') do
      post :create, :stat_affect => { }
    end

    assert_redirected_to stat_affect_path(assigns(:stat_affect))
  end

  def test_should_show_stat_affect
    get :show, :id => stat_affects(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => stat_affects(:one).id
    assert_response :success
  end

  def test_should_update_stat_affect
    put :update, :id => stat_affects(:one).id, :stat_affect => { }
    assert_redirected_to stat_affect_path(assigns(:stat_affect))
  end

  def test_should_destroy_stat_affect
    assert_difference('StatAffect.count', -1) do
      delete :destroy, :id => stat_affects(:one).id
    end

    assert_redirected_to stat_affects_path
  end
end
