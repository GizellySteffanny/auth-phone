class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.build_access
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to users_path, notice: "Cliente #{@user.name} foi salvo com sucesso!"
    else
      render :new
    end
  end

  private
    def params_user
      params.require(:user).permit(:name, :phone, access_attributes: [
        :id, :email, :password, :password_confirmation
      ])
    end
end
