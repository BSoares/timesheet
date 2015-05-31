require "rails_helper"

RSpec.describe Employee do
  subject(:employee) { build(:employee) }

  describe "Validations" do
    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it do
        is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(100)
      end
    end

    describe "cpf" do
      it { is_expected.to validate_presence_of(:cpf) }
      it { is_expected.to validate_uniqueness_of(:cpf) }

      valid_cpfs = ["399.537.274-06", "39953727406", "235.224.884-15"]
      it { is_expected.to allow_value(*valid_cpfs).for(:cpf) }

      invalid_cpfs = [
        "123", "123.456.789-09", "000.000.000-00", "22222222222", "22322252828"]
      it { is_expected.to_not allow_value(*invalid_cpfs).for(:cpf) }
    end
  end

  describe "Normalizations" do
    describe "name" do
      it { is_expected.to normalize_squish_of(:name) }
      it { is_expected.to normalize_blank_of(:name) }
      it { is_expected.to normalize_titleize_of(:name) }
    end
  end
end
