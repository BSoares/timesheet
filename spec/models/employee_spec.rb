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
    end
  end

  describe "Normalizations" do
    describe "name" do
      it { is_expected.to normalize_squish_of(:name) }
      it { is_expected.to normalize_blank_of(:name) }
    end
  end
end
