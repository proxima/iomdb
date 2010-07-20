require 'test_helper'

class SlotAffectsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:slot_affects)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_slot_affect
    assert_difference('SlotAffect.count') do
      post :create, :slot_affect => { }
    end

    assert_redirected_to slot_affect_path(assigns(:slot_affect))
  end

  def test_should_show_slot_affect
    get :show, :id => slot_affects(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => slot_affects(:one).id
    assert_response :success
  end

  def test_should_update_slot_affect
    put :update, :id => slot_affects(:one).id, :slot_affect => { }
    assert_redirected_to slot_affect_path(assigns(:slot_affect))
  end

  def test_should_destroy_slot_affect
    assert_difference('SlotAffect.count', -1) do
      delete :destroy, :id => slot_affects(:one).id
    end

    assert_redirected_to slot_affects_path
  end
end
