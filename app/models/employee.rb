class Employee < ActiveRecord::Base
  has_many :attendances, dependent: :delete_all

  before_save :format_cpf

  validates :cpf,
    presence: true,
    uniqueness: true

  validate :cpf_validation

  validates :name,
    presence: true,
    length: { within: 1..100 }

  normalize_attributes :name,
    with: [:squish, :blank, :titleize]

  def attendances_by_month(date)
    attendances.where(day: date.beginning_of_month..date.end_of_month)
  end

  private

  def cpf_validation
    return if CPF.valid?(cpf)
    errors.add(:cpf, I18n.t("errors.messages.invalid"))
  end

  def format_cpf
    self.cpf = CPF.new(cpf).formatted
  end
end
