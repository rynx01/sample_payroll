class ReimbursementsController < ApplicationController
   

	def index
		  # render html: "hello, world!"
	  @user = User.find(params[:user_id])
	 	if logged_in? && current_user.admin?
	  		@reimbursements = Reimbursement.paginate(page: params[:page])
		else
			@reimbursements = @user.reimbursements.all.paginate(page: params[:page])
		end
	end

	def show
		# render html: "hello, world!"
	   @user = User.find(params[:user_id])
	   @reimbursements = Reimbursement.find(params[:id])
	end

   def destroy
    @user = User.find(params[:user_id])
    @reimbursements = @user.reimbursements.find(params[:id])
    @reimbursements.destroy
    redirect_to user_path
   end

   def create
  	@user = User.find(params[:user_id])
    @reimbursements = @user.reimbursements.create(reimbursements_params)
    redirect_to user_path
   end

   private
    def reimbursements_params
      params.require(:reimbursements).permit(:category, :description, :amount)
    end

end
