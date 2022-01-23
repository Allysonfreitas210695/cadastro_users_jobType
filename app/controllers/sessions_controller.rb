class SessionsController < ApplicationController
  def entrar
    redirect_to root_path if admin_signed_in?
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

  def destroy
    sign_out
    redirect_to session_entrar_path, notice: 'Logoult feito com sucesso'
  end
end
