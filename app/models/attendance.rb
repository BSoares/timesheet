class Attendance < ActiveRecord::Base
  belongs_to :employee

  attr_accessor :employee_cpf

  validates :employee,
    presence: true

  validates :day,
    presence: true,
    uniqueness: { scope: :employee_id }

  validates :entrance_at,
    presence: true
  validate :entrance_at_day_validation

  validate :departure_less_than_entrance_validation
  validate :departure_at_day_validation

  def self.today_attendance(employee)
    Attendance.find_or_initialize_by(employee: employee, day: Date.today)
  end

  private

  def departure_less_than_entrance_validation
    return if departure_at.nil?
    return if departure_at > entrance_at
    errors.add(:departure_at,
      I18n.t("activerecord.errors.attendance.attributes.departure_at" \
        ".greater_than_entrance_at"))
  end

  def entrance_at_day_validation
    attendance_date_check(self.entrance_at, :entrance_at)
  end

  def departure_at_day_validation
    attendance_date_check(self.departure_at, :departure_at)
  end

  def attendance_date_check(field, symbol)
    return if field.nil?
    return if day == field.to_date
    errors.add(symbol, I18n.t("errors.messages.invalid"))
  end
end
