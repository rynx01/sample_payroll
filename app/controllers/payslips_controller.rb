class PayslipsController < ApplicationController

  def index
    # @users = User.all
    # @payrolls  = Payroll.paginate(page: params[:page])
    @payslips  = Payslip.paginate(page: params[:page])
  
  end

  def show

    @reimbursements = Reimbursement.all
    @payslips = Payslip.find(params[:id])

    #cutoff
    @salary = @payslips.employee.base_salary/2

    #sss computation
    @monthly_salary_sss = sssBracket(@salary)
    if @monthly_salary_sss >= 16000
      @monthly_salary_sss = 16000
    end
    @payslips.sss = @monthly_salary_sss*0.0363
    @employer_sss     = @monthly_salary_sss*0.0737

    #philhealth_computation
    @monthly_salary_philhealth = philBracket(@salary)
    @payslips.philhealth = @monthly_salary_philhealth/40
    @employer_philhealth = @payslips.philhealth/2

    #pagibig_computation
    @monthly_salary_pagibig = pagibigBracket(@salary)
    @payslips.pagibig    = @monthly_salary_pagibig
    @employer_philhealth = @monthly_salary_pagibig

    #withholding tax computation
    @withholding_tax = 1000

    #





    #final_pay computation
    @final_pay = 1000




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

  def philBracket (salary)
      salary = salary/1000
      if salary <= 7
        salary = 7000
      elsif salary >= 35
        salary = 35000
      else
        return salary * 1000
      end 
  end

  def pagibigBracket (salary)
      if salary <= 1500
        salary = salary*0.01
      else
        salary = salary*0.02
        if salary >= 100
          return salary = 100
        end
      end
  end







end
