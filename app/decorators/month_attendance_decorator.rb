class MonthAttendanceDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def month_formatted
    l(object.month, format: "%B / %Y")
  end

  def total_time
    seconds_to_time(total_in_seconds)
  end
end
