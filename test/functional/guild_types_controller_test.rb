require 'test_helper'

class GuildTypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:guild_types)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_guild_type
    assert_difference('GuildType.count') do
      post :create, :guild_type => { }
    end

    assert_redirected_to guild_type_path(assigns(:guild_type))
  end

  def test_should_show_guild_type
    get :show, :id => guild_types(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => guild_types(:one).id
    assert_response :success
  end

  def test_should_update_guild_type
    put :update, :id => guild_types(:one).id, :guild_type => { }
    assert_redirected_to guild_type_path(assigns(:guild_type))
  end

  def test_should_destroy_guild_type
    assert_difference('GuildType.count', -1) do
      delete :destroy, :id => guild_types(:one).id
    end

    assert_redirected_to guild_types_path
  end
end
