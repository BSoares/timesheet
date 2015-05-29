require "rspec/expectations"

RSpec::Matchers.define :normalize_titleize_of do |attribute|
  match do |subject|
    instance = subject.class.new

    instance.send("#{attribute}=", "XX")
    return false unless instance.try(attribute) == "Xx"
    instance.send("#{attribute}=", "x x")
    return false unless instance.try(attribute) == "X X"
    instance.send("#{attribute}=", "Xx")
    return false unless instance.try(attribute) == "Xx"

    true
  end

  failure_message do
    "expected to titleize"
  end

  failure_message_when_negated do
    "expected to not titleize"
  end
end
