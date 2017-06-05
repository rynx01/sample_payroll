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
    
    @compute_sss = compute_sss
    @philBracket = philBracket/40
    @pagibigBracket = pagibigBracket
    @hired_status = hired_status
    # @position = position_change


    # redirect_to url_for(:controller => :reimbursements, :action => :show
      # :reimbursements => :category, :reimbursements => :description, :reimbursements => :amount)
    # @reimbursements = Reimbursement.new
    # @reimbursements = @user.reimbursements.find(params[:id])
  end

  # def position_change
  #   @user = User.find(params[:id])
  #   position = @user.position
  #   date_hired = @user.date_hired
  #   if date_hired <= 6.months.ago && position == "Trainee"
  #     position = "Regular"
  #   else
  #     return position
  #   end
  # end

  def destroy
    User.find(params[:id]).destroy
    # @payslips = Payslip.all
    # @user.payslips.destroy
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

  def hired_status
    @user = User.find(params[:id])
    hired_status = (Time.now - @user.date_hired.to_time)/1.months
    return hired_status.to_s.first(2).to_i
  end

  def compute_sss

    @user = User.find(params[:id])
    salary = @user.base_salary/2

    thousands = salary / 1000
    hundreds  = salary % 1000
    percent   = hundreds / 1000.0

    if   percent < 0.25
     thousands = thousands * 1000
    elsif percent < 0.75
     thousands = (thousands * 1000) + 500
    elsif thousands >= 15
     thousands = thousands = 16000
    else 
     thousands = (thousands + 1) * 1000
    end

    # return ((percent < 0.25) ? (thousands * 1000) : (percent < 0.75 ? (thousands * 1000) + 500 : (thousands >= 15 ? 16000 :(thousands + 1) * 1000)))*0.0363  
    return thousands * 0.0363

  end

  def philBracket

      @user = User.find(params[:id])
      salary = @user.base_salary/2

      salary = salary/1000
      if salary <= 7
        salary = 7000
      elsif salary >= 35
        salary = 35000
      else
        return salary * 1000
      end 
  end

  def pagibigBracket

    @user = User.find(params[:id])
    salary = @user.base_salary/2

      if salary <= 1500
        salary = salary*0.01
      else
        salary = salary*0.02
        if salary >= 100
          return salary = 100
        end
      end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :admin, :name, :birthday, :date_hired, :job, :position,
        :contact_no, :account_no, :bank, :base_salary, :no_of_dependents, :status, :sss_no, :philhealth_no, :pagibig_no, :tin_no, :address)
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
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end


    private
    def reimbursements_params
      params.require(:reimbursement).permit(:category, :description, :amount)
    end


  

end