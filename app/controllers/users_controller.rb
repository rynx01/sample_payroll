class UsersController < ApplicationController
  #before_filter :verify_is_admin, :except => [:create]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  

  def index
    @users = User.paginate(page: params[:page])
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC").paginate(page: params[:page])
     else
      @users = User.all.order('created_at DESC').paginate(page: params[:page])
    end
  end

  def show
    @user = User.find(params[:id])
    @reimbursements = @user.reimbursements.all
    

    # redirect_to url_for(:controller => :reimbursements, :action => :show
      # :reimbursements => :category, :reimbursements => :description, :reimbursements => :amount)
    # @reimbursements = Reimbursement.new
    # @reimbursements = @user.reimbursements.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Employee deleted"
    redirect_to users_url
  end

  def new
  	@user = User.new
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account successfully created."
      redirect_to root_url
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :admin, :name, :birthday, 
        :contact_no, :account_no, :bank, :base_salary, :no_of_dependents)
    end

    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # def action_that_calls_one_from_another_controller
    #   controller_you_want = ControllerYouWant.new
    #   controller_you_want.request = request
    #   controller_you_want.response = response
    #   controller_you_want.action_you_want
    # end

    private
    def reimbursements_params
      params.require(:reimbursement).permit(:category, :description, :amount)
    end


  

end