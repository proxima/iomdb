require 'test_helper'

class EquipmentPieceListsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment_piece_lists)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_equipment_piece_list
    assert_difference('EquipmentPieceList.count') do
      post :create, :equipment_piece_list => { }
    end

    assert_redirected_to equipment_piece_list_path(assigns(:equipment_piece_list))
  end

  def test_should_show_equipment_piece_list
    get :show, :id => equipment_piece_lists(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => equipment_piece_lists(:one).id
    assert_response :success
  end

  def test_should_update_equipment_piece_list
    put :update, :id => equipment_piece_lists(:one).id, :equipment_piece_list => { }
    assert_redirected_to equipment_piece_list_path(assigns(:equipment_piece_list))
  end

  def test_should_destroy_equipment_piece_list
    assert_difference('EquipmentPieceList.count', -1) do
      delete :destroy, :id => equipment_piece_lists(:one).id
    end

    assert_redirected_to equipment_piece_lists_path
  end
end
