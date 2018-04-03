class MessagesController < ApplicationController
  before_action :group_create

  def index
    @message = Message.new
    @groups = current_user.matchers.map { |id| MatchUser.find_by(before_user_id: current_user.id, after_user_id: id) ? MatchUser.find_by(before_user_id: current_user.id, after_user_id: id) : MatchUser.find_by(before_user_id: id, after_user_id: current_user.id) }

    @group = Group.find(params[:group_id])
    @messages = @group.messages.includes(:user)
      respond_to do |format|
        format.html
        format.json { @new_message = @messages.where('id > ?', params[:message][:id]) }
      end
  end

  def create
    @groups = Group.find(params[:group_id])
    @message = @groups.messages.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@groups) }
        format.json
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image_url, :user_id)
  end

  def group_create
    current_user.matchers.each do |match_user|
      if MatchUser.find_by(before_user_id: current_user.id, after_user_id: match_user.id)
        @groups = MatchUser.find_by(before_user_id: current_user.id, after_user_id: match_user.id)
      elsif MatchUser.find_by(after_user_id: current_user.id, before_user_id: match_user.id)
        @groups = MatchUser.find_by(after_user_id: current_user.id, before_user_id: match_user.id)
      else
        @group = Group.new
        @group.save
        @groups = MatchUser.create(before_user_id: current_user.id, after_user_id: match_user.id, group_id:@group.id)
      end
    end
  end

end
