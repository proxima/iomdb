require 'test_helper'

class AlignmentLevelsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:alignment_levels)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_alignment_level
    assert_difference('AlignmentLevel.count') do
      post :create, :alignment_level => { }
    end

    assert_redirected_to alignment_level_path(assigns(:alignment_level))
  end

  def test_should_show_alignment_level
    get :show, :id => alignment_levels(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => alignment_levels(:one).id
    assert_response :success
  end

  def test_should_update_alignment_level
    put :update, :id => alignment_levels(:one).id, :alignment_level => { }
    assert_redirected_to alignment_level_path(assigns(:alignment_level))
  end

  def test_should_destroy_alignment_level
    assert_difference('AlignmentLevel.count', -1) do
      delete :destroy, :id => alignment_levels(:one).id
    end

    assert_redirected_to alignment_levels_path
  end
end
