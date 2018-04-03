class PairsController < ApplicationController

  def index
    @selected = params[:selected_value].present? ? params[:selected_value] : 16
    if current_user.gender == "male"
      @users = User.where(gender: 2).page(params[:page]).per(@selected)
    else
      @users = User.where(gender: 1).page(params[:page]).per(@selected)
    end

    @relationship = Relationship.new

  end

  def messages_index

  end

  def search_one
    @users = User.page(params[:page]).per(1)
    save_foot(@users[0].id)
    # @communities = user.communities.page(params[:page]).per(12)
  end

  def myprofile
    @user = User.find(current_user)
  end

  def from_partner

  end

  def visitor_list
    @foot = current_user.comings.order("updated_at DESC").page(params[:page]).per(10)
  end

  def visitor_setting
  end

  def privacy_setting
    @user = User.find(current_user)
  end

  def hide
  end

  def block
  end

  def create_foot
    save_foot(params[:id])
  end

  private

    def save_foot(visitor_id)
      if Foot.exists?(user_id: current_user.id, visitor_id: visitor_id)
        @foot = Foot.find_by(user_id: current_user.id, visitor_id: visitor_id)
        @foot.touch
        @foot.save
      else
        @foot = Foot.new(user_id: current_user.id, visitor_id: visitor_id)
        @foot.save
      end
    end

end
