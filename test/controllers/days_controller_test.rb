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
    response_day
  end

  test "should toogle_wr day" do
    patch :toggle_wr, :format => :json, id: @day
    assert_response :success
    assert_template 'weeks/show'
    response_owner_week
  end

  private

    def response_day
      object = JSON.parse(response.body)
      # contains correct elements
      contains_correct_contents(object)
      # is correct day
      assert_equal(object['id'], @day.id)
      # owned by correct week
      assert_equal(object['week_id'], @day.week.id)
    end

    # contains correct elements
    def contains_correct_contents (object)
      assert_not_nil object['id']
      assert_not_nil object['date']
      assert_not_nil object['oTotal']
      assert_not_nil object['dTotal']
      assert_not_nil object['wr']
      assert_not_nil object['week_id']
    end

    def response_owner_week
      object = JSON.parse(response.body)
      ##
      # owner week contains correct elements
      # already tested on WeeksControllerTest#contains_correct_contents
      ##
      # is correct week
      assert_equal(object['id'], @day.week.id)
    end

end
