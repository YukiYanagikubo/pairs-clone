class DetailsController < ApplicationController
# def show  後で使う予定
#     @usersPage = User.page(params[:page]).per(1)
#     @users = User.all
#     @user = User.find(params[:id])
#     @relationship = Relationship.new
#   end

  def edit
    @user =  User.find(params[:id])
  end

  def update
   user = User.find(params[:id])
   user.update(details_params)
  end

private
  def details_params
    params.require(:user).permit(:residence_id, :alcohol_id, :smoke_id, :occupancy_id, :school_id, :body_id, :holiday_id, :living_with_id, :height_id, :income_id)#Userモデルの○○_idに値を追加する
  end
end
