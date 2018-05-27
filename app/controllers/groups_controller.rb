class GroupsController < ApplicationController
  before_action :group_create

  def index

  end

  def group_create
    @groups = []
    current_user.matchers.each do |match_user|
      if MatchUser.find_by(before_user_id: current_user.id, after_user_id: match_user.id)
        @group = MatchUser.find_by(before_user_id: current_user.id, after_user_id: match_user.id)
      elsif MatchUser.find_by(after_user_id: current_user.id, before_user_id: match_user.id)
        @group = MatchUser.find_by(after_user_id: current_user.id, before_user_id: match_user.id)
      else
        @create_group = Group.new
        @create_group.save
        @group = MatchUser.create(before_user_id: current_user.id, after_user_id: match_user.id, group_id:@create_group.id)
      end
      @groups << @group
    end
  end
end
