require 'test_helper'

class EquipmentPiecesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment_pieces)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_equipment_piece
    assert_difference('EquipmentPiece.count') do
      post :create, :equipment_piece => { }
    end

    assert_redirected_to equipment_piece_path(assigns(:equipment_piece))
  end

  def test_should_show_equipment_piece
    get :show, :id => equipment_pieces(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => equipment_pieces(:one).id
    assert_response :success
  end

  def test_should_update_equipment_piece
    put :update, :id => equipment_pieces(:one).id, :equipment_piece => { }
    assert_redirected_to equipment_piece_path(assigns(:equipment_piece))
  end

  def test_should_destroy_equipment_piece
    assert_difference('EquipmentPiece.count', -1) do
      delete :destroy, :id => equipment_pieces(:one).id
    end

    assert_redirected_to equipment_pieces_path
  end
end
