class Payslip < ApplicationRecord
  belongs_to :employee, class_name: "User", foreign_key: :employee_id
  belongs_to :payroll

  validates :employee, presence: true
  
  # has_many :reimbursements, inverse_of: :payslip

  before_save :set_base_salary, on: :create
  

  def monthly_salary_sss
    salary = employee.base_salary / 2
    thousands = salary / 1000
    hundreds  = salary % 1000
    percent   = hundreds / 1000.0

    if   percent < 0.25
     return thousands * 1000
    elsif percent < 0.75
     return (thousands * 1000) + 500
    elsif thousands >= 15
     return 16000
    else 
     return (thousands + 1) * 1000
    end

  end

  def deduction
    employee.base_salary - monthly_salary_sss
  end


private
  def set_base_salary
    self.base_salary = employee.base_salary
  end  
end
