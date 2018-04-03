class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @usersPage = User.page(params[:page]).per(1)
    # @users = User.all
    # @relationship = Relationship.new
    @image = UserImage.new
    @communities = current_user.communities.page(params[:page]).order("created_at DESC").per(12)
  end

end
