require "rspec/expectations"

RSpec::Matchers.define :normalize_upcase_of do |attribute|
  match do |subject|
    instance = subject.class.new

    instance.send("#{attribute}=", "x")
    return false unless instance.try(attribute) == "X"
    instance.send("#{attribute}=", "xx")
    return false unless instance.try(attribute) == "XX"

    true
  end

  failure_message do
    "expected to convert to uppercase"
  end

  failure_message_when_negated do
    "expected to not convert to uppercase"
  end
end
