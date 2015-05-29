class User < ActiveRecord::Base
  has_secure_password

  validates :name,
    presence: true,
    length: { within: 1..100 }

  validates :email,
    presence: true,
    uniqueness: true,
    length: { maximum: 100 },
    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  normalize_attributes :name,
    with: [:squish, :blank]
  normalize_attributes :email,
    with: [:strip, :blank, :downcase]
  normalize_attributes :password,
    with: :strip
end
