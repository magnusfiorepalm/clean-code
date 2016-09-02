class SwitchStatements

  COMMISSIONED = "commissioned"
  HOURLY       = "hourly"
  SALARIED     = "salaried"

  #1
  def calculate_pay(employee)
    case employee.type
    when COMMISSIONED
      employee.commissioned_pay
    when HOURLY
      employee.hourly_pay
    when SALARIED
      employee.salaried_pay
    else
      raise "Unknown employee type: #{employee.type}"
    end
  end

  #2
  def build_employee(type)
    case type
    when COMMISSIONED
      CommissionedEmployee.new
    when HOURLY
      HourlyEmployee.new
    when SALARIED
      SalariedEmployee.new
    else
      raise "Unknown employee type: #{type}"
    end
  end
end


class CommissionedEmployee
  def pay
    10
  end
end

class HourlyEmployee
  def pay
    100
  end
end

class SalariedEmployee
  def pay
    1000
  end
end
