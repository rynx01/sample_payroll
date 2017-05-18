# require "action_view/helpers/date_helper"

class PayrollsController < ApplicationController

  def index
  	@user = User.find(params[:user_id])
    @payrolls = Payroll.paginate(page: params[:page])
    # datetime_select("payrolls", "periodA")
    # datetime_select("article", "written_on")
  end

  def create
  end

  def new
  end

  def destroy
  end



  private def payrolls_params
  	params.require(:payrolls).permit(:period)
  end

end
