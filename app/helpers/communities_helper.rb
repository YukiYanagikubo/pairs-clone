module CommunitiesHelper

  def search_input
    if @input_n.present?
      @input_n
    else
      @input_c
      #{@input}
    end
  end

end
