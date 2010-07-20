require 'test_helper'

class SpellAffectsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:spell_affects)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_spell_affect
    assert_difference('SpellAffect.count') do
      post :create, :spell_affect => { }
    end

    assert_redirected_to spell_affect_path(assigns(:spell_affect))
  end

  def test_should_show_spell_affect
    get :show, :id => spell_affects(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => spell_affects(:one).id
    assert_response :success
  end

  def test_should_update_spell_affect
    put :update, :id => spell_affects(:one).id, :spell_affect => { }
    assert_redirected_to spell_affect_path(assigns(:spell_affect))
  end

  def test_should_destroy_spell_affect
    assert_difference('SpellAffect.count', -1) do
      delete :destroy, :id => spell_affects(:one).id
    end

    assert_redirected_to spell_affects_path
  end
end
