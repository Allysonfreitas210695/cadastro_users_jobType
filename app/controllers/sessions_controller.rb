class SessionsController < ApplicationController
  def entrar
    # code
  end

  def create
     admin = Admin.find_by_email(params[:email].downcase)
     if admin && admin.authenticate(params[:password])
       sign_in(admin)
       redirect_to root_path
     else
       flash.now[:danger] = 'Invalid'
       render :entrar
     end
  end
end
