# /tests/integration/routes_test.rb
require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test "route test" do
    assert_routing '/weeks', { controller: "weeks", action: "index" }
    assert_routing '/weeks/:week_id/days', { controller: "days", action: "index", week_id: ":week_id" }
    assert_routing '/days/:day_id/ods', { controller: "ods", action: "index", day_id: ":day_id" }
    assert_routing({ method: 'post', path: '/weeks' }, { controller: "weeks", action: "create" })
    assert_routing({ method: 'delete', path: '/weeks/:id' }, { controller: "weeks", action: "destroy", id: ":id" })
    assert_routing({ method: 'patch', path: '/days/:id/toggle_wr' }, { controller: "days", action: "toggle_wr", id: ":id" })
    assert_routing({ method: 'patch', path: '/ods/:id/toggle_o' }, { controller: "ods", action: "toggle_o", id: ":id" })
    assert_routing({ method: 'patch', path: '/ods/:id/toggle_d' }, { controller: "ods", action: "toggle_d", id: ":id" })
  end
end