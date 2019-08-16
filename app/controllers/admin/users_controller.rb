class Admin::UsersController < ApplicationController
  def home
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 8)
  end
end
