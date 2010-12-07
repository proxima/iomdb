require 'test_helper'

class EquipmentPieceListTypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:equipment_piece_list_types)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_equipment_piece_list_type
    assert_difference('EquipmentPieceListType.count') do
      post :create, :equipment_piece_list_type => { }
    end

    assert_redirected_to equipment_piece_list_type_path(assigns(:equipment_piece_list_type))
  end

  def test_should_show_equipment_piece_list_type
    get :show, :id => equipment_piece_list_types(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => equipment_piece_list_types(:one).id
    assert_response :success
  end

  def test_should_update_equipment_piece_list_type
    put :update, :id => equipment_piece_list_types(:one).id, :equipment_piece_list_type => { }
    assert_redirected_to equipment_piece_list_type_path(assigns(:equipment_piece_list_type))
  end

  def test_should_destroy_equipment_piece_list_type
    assert_difference('EquipmentPieceListType.count', -1) do
      delete :destroy, :id => equipment_piece_list_types(:one).id
    end

    assert_redirected_to equipment_piece_list_types_path
  end
end
