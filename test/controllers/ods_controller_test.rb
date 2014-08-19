require 'test_helper'

class OdsControllerTest < ActionController::TestCase
  setup do
    @od = ods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create od" do
    assert_difference('Od.count') do
      post :create, od: { d: @od.d, instant: @od.instant, o: @od.o, timekey: @od.timekey }
    end

    assert_redirected_to od_path(assigns(:od))
  end

  test "should show od" do
    get :show, id: @od
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @od
    assert_response :success
  end

  test "should update od" do
    patch :update, id: @od, od: { d: @od.d, instant: @od.instant, o: @od.o, timekey: @od.timekey }
    assert_redirected_to od_path(assigns(:od))
  end

  test "should destroy od" do
    assert_difference('Od.count', -1) do
      delete :destroy, id: @od
    end

    assert_redirected_to ods_path
  end
end
