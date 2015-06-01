class MonthAttendance
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :employee, :month

  validates :employee,
    presence: true

  validates :month,
    presence: true

  def initialize(attributes = {})
    self.attributes = attributes
  end

  def total_in_seconds
    return 0 if attendances.empty?
    seconds = 0
    attendances.each do |attendance|
      seconds += (attendance.departure_at -
        attendance.entrance_at) if attendance.departure_at.present?
    end
    seconds
  end

  def attributes=(attributes)
    @employee = attributes[:employee]
    @month = parse_date_param(attributes[:month])
  end

  def persisted?
    false
  end

  def month=(value)
    @month = parse_date_param(value)
  end

  def attendances
    return [] if @employee.nil? || @month.nil?
    @employee.attendances_by_month(@month)
  end

  private

  def parse_date_param(value)
    return value if value.is_a?(Date)
    return Date.parse(value) if value.is_a?(String)
    return value.to_date if value.is_a?(DateTime)
    nil
  rescue
    nil
  end
end
