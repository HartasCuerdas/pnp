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
    assert_template 'ods/od_day_week'
    response_toggle_od
  end

  test "should toggle_d od" do
    patch :toggle_d, :format => :json, id: @od
    assert_response :success
    assert_template 'ods/od_day_week'
    response_toggle_od
  end

  private

    def response_toggle_od
      object = JSON.parse(response.body)
      contains_correct_contents(object['od'])
      assert_equal(object['day']['id'], @od.day.id)
      assert_equal(object['week']['id'], @od.day.week.id)
    end

    # contains correct elements
    def contains_correct_contents (object)
      assert_not_nil object['id']
      assert_not_nil object['timekey']
      assert_not_nil object['o']
      assert_not_nil object['d']
      assert_not_nil object['day_id']
    end

end
