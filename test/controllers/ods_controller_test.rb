require 'test_helper'

class OdsControllerTest < ActionController::TestCase
  setup do
    @od = ods(:one)
  end

  test "should get index" do
    get :index, :format => :json, day_id: @od.day
    assert_response :success
    assert_template 'ods/index'
    assert_not_nil assigns(:ods)
  end

  test "should toggle_o od" do
    patch :toggle_o, :format => :json, id: @od
    assert_response :success
  end

  test "should toggle_d od" do
    patch :toggle_d, :format => :json, id: @od
    assert_response :success
  end

end
