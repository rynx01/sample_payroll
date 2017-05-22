class PayslipsController < ApplicationController

  def index
    # @users = User.all
    # @payrolls  = Payroll.paginate(page: params[:page])
    @payslips  = Payslip.paginate(page: params[:page])
  
  end

  def show
    # @users = User.find(params[:user_id])
    # @payrolls = Payroll.find(params[:id])
    @reimbursements = Reimbursement.all
    @payslips = Payslip.find(params[:id])
    @base_salary = @payslips.employee.base_salary/2
    # if @base_salary <= 1000
    #   @total_salary = 1000
    #   @ee = 
    #   @er = 
    # end

    # @sss = @payslips.sss
    # @sss = @payslips.base_salary 
    # @payslips = @users.payslips.find(params[:id])
    # @users = User.find(params[:user_id])
    # @payslips = Payslip.find(params[:id])
    # @payslip = @users.payslips.includes(:employee)
  end

  def new
    @payslip = Payslip.new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private 

  def payroll_params
    params.require(:payroll).permit(:start_period, :end_period)
  end
  
  def payslip_params
    params.require(:payslip).permit(:base_salary, :sss, :pagibig, 
                                                :philhealth, :paid)
  end


end
