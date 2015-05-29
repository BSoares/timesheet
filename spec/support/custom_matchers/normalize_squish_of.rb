require "rspec/expectations"

RSpec::Matchers.define :normalize_squish_of do |attribute|
  match do |subject|
    instance = subject.class.new

    instance.send("#{attribute}=", " x  ")
    return false unless instance.try(attribute).downcase == "x"
    instance.send("#{attribute}=", "x  x")
    return false unless instance.try(attribute).downcase == "x x"

    true
  end

  failure_message do
    "expected to strip leading and trailing whitespace and convert any" \
    "consecutive spaces to one space each"
  end

  failure_message_when_negated do
    "expected to not strip leading and trailing whitespace and convert any" \
    "consecutive spaces to one space each"
  end
end
