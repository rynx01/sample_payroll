# require "action_view/helpers/date_helper"

class PayrollsController < ApplicationController

  def index
    @employees = User.all
    @payrolls  = Payroll.paginate(page: params[:page])
  end

  def new
    @payroll = Payroll.new  
  end

  def create
    @payroll = Payroll.new payroll_params

    if @payroll.save
      redirect_to @payroll, notice: "Payroll created."
    else
      render action: :new
    end
  end

  def show
    @payroll = Payroll.find(params[:id])
    @payslips = @payroll.payslips.includes(:employee)
  end
 
  # def new
  #   @user = User.all
  #   @payrolls = Payroll.new
  # end

  # def create
  #   @payrolls = Payroll.new(payrolls_params)
  #   # @users = User.all
  #   # @payrolls = @users.payrolls.new(payrolls_params)
  #   if @payrolls.save
  #     flash[:success] = "Payroll successfully created."
  #     redirect_to user_payrolls_path
  #     # Handle a successful save.
  #   else
  #     render 'new'
  #   end
  # end

  def destroy
  end

  private 

  def payroll_params
    params.require(:payroll).permit(:start_period, :end_period)
  end
end
