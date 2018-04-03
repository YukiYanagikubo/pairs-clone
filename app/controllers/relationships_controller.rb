class RelationshipsController < ApplicationController

   def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    redirect_to :root
  end

end
