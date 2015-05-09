require 'test_helper'

class MappingsControllerTest < ActionController::TestCase
  setup do
    @mapping = mappings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mapping" do
    assert_difference('Mapping.count') do
      post :create, mapping: { post_id: @mapping.post_id, user_id: @mapping.user_id }
    end

    assert_redirected_to mapping_path(assigns(:mapping))
  end

  test "should show mapping" do
    get :show, id: @mapping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mapping
    assert_response :success
  end

  test "should update mapping" do
    patch :update, id: @mapping, mapping: { post_id: @mapping.post_id, user_id: @mapping.user_id }
    assert_redirected_to mapping_path(assigns(:mapping))
  end

  test "should destroy mapping" do
    assert_difference('Mapping.count', -1) do
      delete :destroy, id: @mapping
    end

    assert_redirected_to mappings_path
  end
end
