class Payroll < ApplicationRecord
  # validates :period, presence: true
  validates :start_period, presence: true
  validates :end_period, presence: true
  validate :end_is_after_start_period

  has_many :payslips, inverse_of: :payroll
  after_create :create_payslips

private
  def create_payslips
    User.all.each do |employee|
      self.payslips.find_by(employee: employee) || self.payslips.create(employee: employee)
    end
  end

  def end_is_after_start_period
    errors.add(:end_period, "should be after start period") if end_period <= start_period
  end
end
