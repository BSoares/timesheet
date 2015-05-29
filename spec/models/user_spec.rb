require "rails_helper"

RSpec.describe User do
  subject(:user) { build(:user) }

  describe "have_secure_password is required" do
    it { is_expected.to have_secure_password }
  end

  describe "Validations" do
    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it do
        is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(100)
      end
    end

    describe "email" do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_uniqueness_of(:email) }
      it { is_expected.to validate_length_of(:email).is_at_most(100) }

      valid_addresses = ["joao@bio.com.br", "a@a.cc", "a.a@a.cc", "a+1@a.cc"]
      it { is_expected.to allow_value(*valid_addresses).for(:email) }

      invalid_addresses = ["a", "a@a", "a..a@a.com", "@.", "com.a@a"]
      it { is_expected.to_not allow_value(*invalid_addresses).for(:email) }
    end
  end

  describe "Normalizations" do
    describe "name" do
      it { is_expected.to normalize_squish_of(:name) }
      it { is_expected.to normalize_blank_of(:name) }
    end

    describe "email" do
      it { is_expected.to normalize_strip_of(:email) }
      it { is_expected.to normalize_blank_of(:email) }
      it { is_expected.to normalize_downcase_of(:email) }
    end

    describe "password" do
      it { is_expected.to normalize_strip_of(:password) }
    end
  end
end
