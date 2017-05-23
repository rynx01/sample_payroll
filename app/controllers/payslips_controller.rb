class PayslipsController < ApplicationController

  def index
    # @users = User.all
    # @payrolls  = Payroll.paginate(page: params[:page])
    @payslips  = Payslip.paginate(page: params[:page])
  
  end

  def show

    @reimbursements = Reimbursement.all
    @payslips = Payslip.find(params[:id])
    # @cutoff_salary = @payslips.employee.base_salary/2
    @salary = @payslips.employee.base_salary
    @monthly_salary = sssBracket(@salary)
    if @monthly_salary >= 16000
      @monthly_salary = 16000
    end
    @payslips.sss = @monthly_salary*0.0363
    @employer     = @monthly_salary*0.0737


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

  def sssBracket (salary)
     thousands = salary/1000
     hundreds  = salary%1000
     percent   = hundreds/1000.0

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




end
