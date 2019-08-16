class Admin::UsersController < ApplicationController
  def home
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 8)
  end

  def update
    @user = User.find(params[:id])
    @user.update_attribute(:is_admin, true)

    redirect_to admin_users_url
  end

  def destroy
    @user = User.find(params[:id])
    @user.update_attribute(:is_admin, false)

    redirect_to admin_users_url
  end
end
