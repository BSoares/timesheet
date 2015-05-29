require "rspec/expectations"

RSpec::Matchers.define :normalize_number_of do |attribute|
  match do |subject|
    instance = subject.class.new

    instance.send("#{attribute}=", "01")
    return false unless instance.try(attribute) == "01"
    instance.send("#{attribute}=", "a1")
    return false unless instance.try(attribute) == "1"
    instance.send("#{attribute}=", "1b")
    return false unless instance.try(attribute) == "1"
    instance.send("#{attribute}=", "0-1")
    return false unless instance.try(attribute) == "01"

    true
  end

  failure_message do
    "expected to return nil on empty strings"
  end

  failure_message_when_negated do
    "expected to not return nil on empty strings"
  end
end
