require 'test_helper'

class ResistanceAffectsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:resistance_affects)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_resistance_affect
    assert_difference('ResistanceAffect.count') do
      post :create, :resistance_affect => { }
    end

    assert_redirected_to resistance_affect_path(assigns(:resistance_affect))
  end

  def test_should_show_resistance_affect
    get :show, :id => resistance_affects(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => resistance_affects(:one).id
    assert_response :success
  end

  def test_should_update_resistance_affect
    put :update, :id => resistance_affects(:one).id, :resistance_affect => { }
    assert_redirected_to resistance_affect_path(assigns(:resistance_affect))
  end

  def test_should_destroy_resistance_affect
    assert_difference('ResistanceAffect.count', -1) do
      delete :destroy, :id => resistance_affects(:one).id
    end

    assert_redirected_to resistance_affects_path
  end
end
