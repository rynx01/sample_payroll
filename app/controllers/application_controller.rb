class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # before_filter :verify_is_admin, :only => [:new, :create, :destroy]
   

  include SessionsHelper

   

end