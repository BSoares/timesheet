require "rspec/expectations"

RSpec::Matchers.define :normalize_strip_of do |attribute|
  match do |subject|
    instance = subject.class.new

    instance.send("#{attribute}=", " x  ")
    return false unless instance.try(attribute) == "x"

    true
  end

  failure_message do
    "expected to strip leading and trailing whitespace"
  end

  failure_message_when_negated do
    "expected to not strip leading and trailing whitespace"
  end
end
