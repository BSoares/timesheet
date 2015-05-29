require "rspec/expectations"

RSpec::Matchers.define :normalize_downcase_of do |attribute|
  match do |subject|
    instance = subject.class.new

    instance.send("#{attribute}=", "X")
    return false unless instance.try(attribute) == "x"
    instance.send("#{attribute}=", "XX")
    return false unless instance.try(attribute) == "xx"

    true
  end

  failure_message do
    "expected to convert to lowercase"
  end

  failure_message_when_negated do
    "expected to not convert to lowercase"
  end
end
