require 'test_helper'

class SlotsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:slots)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_slot
    assert_difference('Slot.count') do
      post :create, :slot => { }
    end

    assert_redirected_to slot_path(assigns(:slot))
  end

  def test_should_show_slot
    get :show, :id => slots(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => slots(:one).id
    assert_response :success
  end

  def test_should_update_slot
    put :update, :id => slots(:one).id, :slot => { }
    assert_redirected_to slot_path(assigns(:slot))
  end

  def test_should_destroy_slot
    assert_difference('Slot.count', -1) do
      delete :destroy, :id => slots(:one).id
    end

    assert_redirected_to slots_path
  end
end
