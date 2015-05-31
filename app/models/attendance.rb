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
  validate :entrance_in_another_day_validation

  validate :departure_less_than_entrance_validation
  validate :departure_in_another_day_validation

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

  def departure_in_another_day_validation
    return if departure_at.nil?
    return if day == departure_at.to_date
    errors.add(:departure_at, I18n.t("errors.messages.invalid"))
  end

  def entrance_in_another_day_validation
    return if entrance_at.nil?
    return if day == entrance_at.to_date
    errors.add(:entrance_at, I18n.t("errors.messages.invalid"))
  end
end
