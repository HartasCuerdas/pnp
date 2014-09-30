require 'test_helper'

class WeekTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should save week without firstDay" do
    week = Week.new
    assert week.save, "Saved the week without a firstDay"
  end

end
