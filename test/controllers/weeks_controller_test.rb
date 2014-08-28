require 'test_helper'

class WeeksControllerTest < ActionController::TestCase
  setup do
    @week = weeks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weeks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create week" do
    assert_difference('Week.count') do
      post :create, week: { comment: @week.comment, firstDay: @week.firstDay, month_id: @week.month_id }
    end

    assert_redirected_to week_path(assigns(:week))
  end

  test "should show week" do
    get :show, id: @week
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @week
    assert_response :success
  end

  test "should update week" do
    patch :update, id: @week, week: { comment: @week.comment, firstDay: @week.firstDay, month_id: @week.month_id }
    assert_redirected_to week_path(assigns(:week))
  end

  test "should destroy week" do
    assert_difference('Week.count', -1) do
      delete :destroy, id: @week
    end

    assert_redirected_to weeks_path
  end
end
