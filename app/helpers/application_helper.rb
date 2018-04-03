module ApplicationHelper

  def format_posted_timeHM(date)
  date.strftime("%H:%M:%S")
  end

  def format_posted_timeYMD(date)
  date.strftime("%m月%d日")
  end

end
