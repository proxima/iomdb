require 'test_helper'

class SkillAffectsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:skill_affects)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_skill_affect
    assert_difference('SkillAffect.count') do
      post :create, :skill_affect => { }
    end

    assert_redirected_to skill_affect_path(assigns(:skill_affect))
  end

  def test_should_show_skill_affect
    get :show, :id => skill_affects(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => skill_affects(:one).id
    assert_response :success
  end

  def test_should_update_skill_affect
    put :update, :id => skill_affects(:one).id, :skill_affect => { }
    assert_redirected_to skill_affect_path(assigns(:skill_affect))
  end

  def test_should_destroy_skill_affect
    assert_difference('SkillAffect.count', -1) do
      delete :destroy, :id => skill_affects(:one).id
    end

    assert_redirected_to skill_affects_path
  end
end
