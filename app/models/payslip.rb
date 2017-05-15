class Payslip < ApplicationRecord
  belongs_to :user
  belongs_to :reimbursement
  belongs_to :dope_adjustment
  belongs_to :nope_adjustment
  belongs_to :allowance
  validates :user_id, presence: true
end
