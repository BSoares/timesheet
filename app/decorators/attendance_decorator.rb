class AttendanceDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def total
    if departure_at.present?
      seconds_to_time(departure_at - entrance_at)
    else
      "-"
    end
  end

  def entrance_time
    datetime_to_time(entrance_at)
  end

  def departure_time
    if departure_at.present?
      datetime_to_time(departure_at)
    else
      t("month_attendances.show.without_departure")
    end
  end
end
