module ApplicationHelper

  def convert_to_date(date)
    Date.parse(date) + 7.days
  end

end
