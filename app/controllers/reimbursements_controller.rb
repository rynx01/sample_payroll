class ReimbursementsController < ApplicationController
    before_action :correct_user,   only: :destroy


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


   def edit
   	@user = User.find(params[:user_id])
   	@reimbursement = @user.reimbursements.find(params[:reimbursement])
   	
   end

   def update
   	@user = User.find(params[:user_id])
   	@reimbursement = @user.reimbursements.find(params[:reimbursement])
    if @reimbursement.update_attributes(:reimbursement)
      flash[:success] = "Reimbursement updated"
      redirect_to user_reimbursements_path
    else
      render 'edit'
    end
   end

   def destroy
   	@user = User.find(params[:user_id])
   	@reimbursements = @user.reimbursements.find(params[:id])
    @reimbursements.destroy
    flash.now[:success] = "Reimbursement deleted"
    redirect_to request.referrer || root_url
   end

   def create
  	@user = User.find(params[:user_id])
  	@reimbursements = Reimbursement.new(:reimbursement)
    if @reimbursements.save
      flash[:success] = "Reimbursement successfully created."
      redirect_to root_url
      # Handle a successful save.
    else
      render 'new'
    end
   end

   def new
   	@user = User.find(params[:user_id])
   	@reimbursements = Reimbursement.new
   end
   
   def correct_user
      @reimbursements = current_user.reimbursements.find_by(id: params[:id])
      redirect_to user_path if @reimbursements.nil?
   end

   private
    def reimbursements_params
      params.require(:reimbursement).permit(:category, :description, :amount)
    end

end
