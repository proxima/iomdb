require 'test_helper'

class GuildsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:guilds)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_guild
    assert_difference('Guild.count') do
      post :create, :guild => { }
    end

    assert_redirected_to guild_path(assigns(:guild))
  end

  def test_should_show_guild
    get :show, :id => guilds(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => guilds(:one).id
    assert_response :success
  end

  def test_should_update_guild
    put :update, :id => guilds(:one).id, :guild => { }
    assert_redirected_to guild_path(assigns(:guild))
  end

  def test_should_destroy_guild
    assert_difference('Guild.count', -1) do
      delete :destroy, :id => guilds(:one).id
    end

    assert_redirected_to guilds_path
  end
end
