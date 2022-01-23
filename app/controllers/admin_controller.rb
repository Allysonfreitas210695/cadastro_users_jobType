class AdminController < ApplicationController
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def new
  @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to users_path, notice: 'Admin was successfully created'
    else
      render :new
    end
  end

  private
  def params_admin
      params.require(:admin).permit(:email, :name, :password, :password_confirmation)
  end
end
