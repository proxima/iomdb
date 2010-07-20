require 'test_helper'

class SkillTrainSpecsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:skill_train_specs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_skill_train_spec
    assert_difference('SkillTrainSpec.count') do
      post :create, :skill_train_spec => { }
    end

    assert_redirected_to skill_train_spec_path(assigns(:skill_train_spec))
  end

  def test_should_show_skill_train_spec
    get :show, :id => skill_train_specs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => skill_train_specs(:one).id
    assert_response :success
  end

  def test_should_update_skill_train_spec
    put :update, :id => skill_train_specs(:one).id, :skill_train_spec => { }
    assert_redirected_to skill_train_spec_path(assigns(:skill_train_spec))
  end

  def test_should_destroy_skill_train_spec
    assert_difference('SkillTrainSpec.count', -1) do
      delete :destroy, :id => skill_train_specs(:one).id
    end

    assert_redirected_to skill_train_specs_path
  end
end
