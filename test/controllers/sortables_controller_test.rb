require 'test_helper'

class SortablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sortable = sortables(:one)
  end

  test "should get index" do
    get sortables_url
    assert_response :success
  end

  test "should get new" do
    get new_sortable_url
    assert_response :success
  end

  test "should create sortable" do
    assert_difference('Sortable.count') do
      post sortables_url, params: { sortable: { position: @sortable.position } }
    end

    assert_redirected_to sortable_url(Sortable.last)
  end

  test "should show sortable" do
    get sortable_url(@sortable)
    assert_response :success
  end

  test "should get edit" do
    get edit_sortable_url(@sortable)
    assert_response :success
  end

  test "should update sortable" do
    patch sortable_url(@sortable), params: { sortable: { position: @sortable.position } }
    assert_redirected_to sortable_url(@sortable)
  end

  test "should destroy sortable" do
    assert_difference('Sortable.count', -1) do
      delete sortable_url(@sortable)
    end

    assert_redirected_to sortables_url
  end
end
