module SessionsHelper
  def sign_in(admin)
    session[:admin_id] = admin.id
  end

  def segn_out
    session.delete(:admin_id)
  end

  def current_admin
    @current_admin ||= Admin.find_by_id(session[:admin_id])
  end

  def admin_signed_in?
    !current_admin.nil?
  end
end
