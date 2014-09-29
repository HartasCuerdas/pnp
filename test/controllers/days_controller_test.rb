require 'test_helper'

class DaysControllerTest < ActionController::TestCase
  setup do
    @day = days(:one)
  end

  test "should get index" do
    get :index, :format => :json, week_id: @day.week
    assert_response :success
    assert_template 'days/index'
    assert_not_nil assigns(:days)
  end

  test "should show day" do
    get :show, :format => :json, id: @day
    assert_response :success
    assert_template 'days/show'
    response_contains_day_elements
  end

  test "should toogle_wr day" do
    patch :toggle_wr, :format => :json, id: @day
    assert_response :success
    assert_template 'weeks/show'
    response_contains_week_elements
  end

  private

    def response_contains_day_elements
      object = JSON.parse(response.body)
      assert_not_nil object['id']
      assert_not_nil object['date']
      assert_not_nil object['oTotal']
      assert_not_nil object['dTotal']
      assert_not_nil object['well_registered']
      assert_not_nil object['week_id']
    end

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
