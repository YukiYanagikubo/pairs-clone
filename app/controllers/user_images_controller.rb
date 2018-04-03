class UserImagesController < ApplicationController
  def create
    if User.find_by(id: params[:user_id]).UserImages.find_by(status: 1).present?
      @image = UserImage.find_by(user_id: params[:user_id])
      @image.update(image_params)
    else
      @image = UserImage.create(image_params)
    end

    redirect_to user_path(current_user)

  end

  private
  def image_params
    params.require(:user_image).permit(:content, :status).merge(user_id: current_user.id)
  end
end
