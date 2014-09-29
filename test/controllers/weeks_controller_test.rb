require 'test_helper'

class WeeksControllerTest < ActionController::TestCase
  setup do
    @week = weeks(:one)
  end

  test "should get index" do
    get :index, :format => :json
    assert_response :success
    assert_template 'weeks/index'
    assert_not_nil assigns(:weeks)
  end

  test "should create week" do
    assert_difference('Week.count') do
      post :create, :format => :json, week: { firstDay: @week.firstDay }
    end
    
    assert_response :success
    assert_template 'weeks/show'
    response_contains_week_elements
  end

  test "should show week" do
    get :show, :format => :json, id: @week
    assert_response :success
    assert_template 'weeks/show'
    response_contains_week_elements
  end

  test "should destroy week" do
    assert_difference('Week.count', -1) do
      delete :destroy, :format => :json, id: @week
    end

    assert_response :success
  end

  private

    def response_contains_week_elements
      object = JSON.parse(response.body)
      assert_not_nil object['id']
      assert_not_nil object['oAVG']
      assert_not_nil object['dAVG']
      assert_not_nil object['oMAX']
      assert_not_nil object['dMAX']
      assert_not_nil object['oMIN']
      assert_not_nil object['dMIN']
      assert (object.include? 'comment')
    end

end
