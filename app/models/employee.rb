class Employee < ActiveRecord::Base
  validates :cpf,
    presence: true,
    uniqueness: true

  validates :name,
    presence: true,
    length: { within: 1..100 }

  normalize_attributes :name,
    with: [:squish, :blank]
end
