class ReimbursementsController < ApplicationController
   

	def index
		  # render html: "hello, world!"
	  @user = User.find(params[:user_id])
		# @reimbursements = @user.reimbursements.paginate(page: params[:page])
	  @reimbursements = Reimbursement.paginate(page: params[:page])
	end

  def destroy
    @reimbursements.destroy
    flash[:success] = "Reimbursement deleted"
    redirect_to request.referrer || user_url
  end

  def create
  end


end
