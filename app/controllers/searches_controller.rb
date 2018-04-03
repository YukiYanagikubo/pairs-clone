class SearchesController < ApplicationController
   DISPLAYED_USER = 16


  #条件検索用にgem "ransack"を使用しています
  def search_index
    @q = User.ransack(params[:q])
    @residence = Residence.all
    @alcohol = Alcohol.all
    @smoke = Smoke.all
    @occupancy = Occupancy.all
    @school = School.all
    @body = Body.all
    @holiday = Holiday.all
    @living_with = LivingWith.all
    @height = Height.all
    @age = Age.all
    @income = Income.all
  end

  def search_result
    @selected = params[:selected_value].present? ? params[:selected_value] : 16
    @q = User.search(search_params)
    if current_user.gender == "male"
      @users = @q.result(distinct: true).where(gender: 2).page(params[:page]).per(@selected)
    else
      @users = @q.result(distinct: true).where(gender: 1).page(params[:page]).per(@selected)
    end
    # @q = User.search(search_params)
    # @users = @q.result(distinct: true).page(params[:page]).per(DISPLAYED_USER)
  end

  private
  def search_params
    params.require(:q).permit(
      :income_id_gteq, :income_id_lteq,
      :age_id_gteq, :age_id_lteq,
      :height_id_gteq, :height_id_lteq,
      :residence_id_eq,
      :smoke_id_eq,
      :occupancy_id_eq,
      alcohol_id_in:[],
      school_id_in:[],
      body_id_in:[],
      holiday_id_in:[],
      living_with_id_in:[]
      )
  end
end
