require "rspec/expectations"

RSpec::Matchers.define :normalize_blank_of do |attribute|
  match do |subject|
    instance = subject.class.new

    instance.send("#{attribute}=", "")
    return false unless instance.try(attribute).nil?
    instance.send("#{attribute}=", " ")
    return false unless instance.try(attribute).nil?
    instance.send("#{attribute}=", "  ")
    return false unless instance.try(attribute).nil?

    true
  end

  failure_message do
    "expected to return nil on empty strings"
  end

  failure_message_when_negated do
    "expected to not return nil on empty strings"
  end
end
