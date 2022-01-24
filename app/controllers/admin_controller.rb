class AdminController < ApplicationController
  before_action :set_admin, only: [:edit, :update, :destroy]
  before_action :set_admin, only: [:edit, :update]

  def index
    @admins = Admin.all
  end

  def new
  @admin = Admin.new
  end

  def edit

  end

  def update
    if @admin.update(params_admin)
      redirect_to admin_index_path, notice: 'Administrador atualizando com sucesso!'
    else
      render :edit
    end
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to session_entrar_path, notice: 'Admin criado com sucesso!'
    else
      render :new
    end
  end

  def lista_users
    @lista_users = User.where(admin: current_admin)
  end

  private

  def params_admin
      params.require(:admin).permit(:email, :name, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
