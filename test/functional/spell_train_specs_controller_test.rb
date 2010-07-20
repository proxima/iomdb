require 'test_helper'

class SpellTrainSpecsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:spell_train_specs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_spell_train_spec
    assert_difference('SpellTrainSpec.count') do
      post :create, :spell_train_spec => { }
    end

    assert_redirected_to spell_train_spec_path(assigns(:spell_train_spec))
  end

  def test_should_show_spell_train_spec
    get :show, :id => spell_train_specs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => spell_train_specs(:one).id
    assert_response :success
  end

  def test_should_update_spell_train_spec
    put :update, :id => spell_train_specs(:one).id, :spell_train_spec => { }
    assert_redirected_to spell_train_spec_path(assigns(:spell_train_spec))
  end

  def test_should_destroy_spell_train_spec
    assert_difference('SpellTrainSpec.count', -1) do
      delete :destroy, :id => spell_train_specs(:one).id
    end

    assert_redirected_to spell_train_specs_path
  end
end
