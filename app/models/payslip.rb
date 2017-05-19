class Payslip < ApplicationRecord
  belongs_to :employee, class_name: "User", foreign_key: :employee_id
  belongs_to :payroll

  validates :employee, presence: true

  before_save :set_base_salary, on: :create

  private
  def set_base_salary
    self.base_salary = employee.base_salary
  end
end
