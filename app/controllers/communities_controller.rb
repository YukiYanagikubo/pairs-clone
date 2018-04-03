class CommunitiesController < ApplicationController
  # before_action :set_user
  # before_action :search_default, only: :search
  # before_action :authenticate_user!, only: :search

  def index
    # カレントユーザーが持っている（作成）したコミュニティカウント用
    @communities_count = current_user.communities
    # カレントユーザーが持っている（作成）したコミュニティ全て
    @communities = @communities_count.page(params[:page]).order("created_at DESC").per(5)

    # 作成されているコミュニティ全て
    @communities_all = Community.page(params[:page]).order("created_at DESC").per(15)

    # 検索結果コミュニティ（おすすめコミュニティなどで使用しており、現在コメアウトされているのでオフ）
    # @communities_result = current_user.communities.page(params[:page]).order("created_at DESC").per(5)

    # パラメータとして名前かカテゴリを受け取っている場合は絞って検索する
    if params[:community_name].present?
      @communities_result = @communities_all.get_by_community_name params[:community_name]
    end
    if params[:category].present?
      @communities_result = @communities_all.get_by_category params[:category]
    end

  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.image.retrieve_from_cache! params[:cache][:image]
    if params[:back]
      render :new
    elsif @community.save
      @community.users << current_user
      # render :index                :値を渡さず、ビューのみを持ってくる
      # redirect_to communities_path :URL自体にアクセスする
      redirect_to community_complete_path
    else
      render :new
    end
  end

  def confirm
    @community = Community.new(community_params)
    render :new if @community.invalid?
  end

  def complete
  end

  def show
    @community = Community.find(params[:id])

    # @community.users.build
    # @selected = params[:selected_value].present? ? params[:selected_value] : 16
    if current_user.gender == "male"
      @users = @community.users.where(gender: 2).page(params[:page]).per(16)
      @users_opposite = @community.users.where(gender: 1)
      # @users = User.where(gender: 2).page(params[:page]).per(16)
      # @users = @users.where(community_id: params[:id]).page(params[:page]).per(16)
    else
      @users = @community.users.where(gender: 1).page(params[:page]).per(16)
      @users_opposite = @community.users.where(gender: 2)
    end
  end

  def join
    @community = Community.find(params[:id])
    @community.users << current_user
  end

  def leave
    @community = Member.find_by(user_id: current_user.id, community_id: params[:id])
    @community.destroy
  end

  def search
      # @communities = Community.all :ページネイト仕様変更前/本サイトのperは300
    @communities_result = Community.all.page(params[:page]).order("created_at DESC").per(12)

    if params[:community_name].present?
      @input_n = params[:community_name]
      @communities_result = @communities_result.get_by_community_name params[:community_name]
      @communities_result = @communities_result.page(params[:page]).order("created_at DESC").per(12)
    end
    if params[:category].present?
      @input_c = t("enums.community.category.#{params[:category]}")
      @communities_result = @communities_result.get_by_category params[:category]
      @communities_result = @communities_result.page(params[:page]).order("created_at DESC").per(12)
    end
  end

  private

  def community_params
    params.require(:community).permit(:community_name, :category, :image, user_ids: [] )
    # params.require(:community).permit(:community_name, :category, :image).merge(user_id: current_user.id)
  end

  def community_users_params
    params.require(:community).permit(:community_name, :category, :image, communities_attributes: [:name] )
    # params.require(:community).permit(:community_name, :category, :image).merge(user_id: current_user.id)
  end
  # def search_default
  #   @communities_all = Community.page(params[:page]).order("created_at DESC").per(5)
  # end
  # 参考
  # def group_params
  #   params.require(:group).permit(:group_name, { :user_ids => [] })
  # end

end
