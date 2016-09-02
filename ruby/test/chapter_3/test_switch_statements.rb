require "minitest/autorun"
require "../../lib/chapter_3/switch_statements"
require "ostruct"

class TestSwitchStatements < Minitest::Test

  def setup
    @object = SwitchStatements.new
  end

  def test_calculate_pay
    commissioned_employee = OpenStruct.new(type: SwitchStatements::COMMISSIONED, commissioned_pay: 10, hourly_pay: 100, salaried_pay: 1000)
    hourly_employee       = OpenStruct.new(type: SwitchStatements::HOURLY, commissioned_pay: 10, hourly_pay: 100, salaried_pay: 1000)
    salaried_employee     = OpenStruct.new(type: SwitchStatements::SALARIED, commissioned_pay: 10, hourly_pay: 100, salaried_pay: 1000)
    assert_equal 10, @object.calculate_pay(commissioned_employee)
    assert_equal 100, @object.calculate_pay(hourly_employee)
    assert_equal 1000, @object.calculate_pay(salaried_employee)
  end

  def test_build_employee
    assert_equal 10, @object.build_employee(SwitchStatements::COMMISSIONED).pay
    assert_equal 100, @object.build_employee(SwitchStatements::HOURLY).pay
    assert_equal 1000, @object.build_employee(SwitchStatements::SALARIED).pay
  end

end
