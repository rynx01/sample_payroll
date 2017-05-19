class PayslipsController < ApplicationController

  def index
    @payslips = Payslip.paginate(page: params[:page])
  end

  def show
    @users = User.find(params[:user_id])
    @payslips = Payslip.find(params[:id])
    @payslip = @users.payslips.includes(:employee)
  end

  def new
    # @user = User.find(params[:user_id])
    # @payslip = Payslip.new
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

end
