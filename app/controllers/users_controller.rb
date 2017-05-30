class UsersController < ApplicationController
  # https://github.com/CanCanCommunity/cancancan/wiki/authorizing-controller-actions
  # load_and_authorize_resource only: []
  skip_authorization_check only: [:analytics_alias, :index]

  def analytics_alias
    # view file has JS that will identify the anonymous user through segment
    # after registration via "after devise registration path"
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_info)
  end

  def user_info
    params.require(:users).permit(:first_name, :last_Name, :email)
  end

  def edit
    @user = User.find(params[:id])
  end
end
