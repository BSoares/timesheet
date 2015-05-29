AttributeNormalizer.configure do |config|
  config.normalizers[:titleize] = lambda do |value, _options|
    value.is_a?(String) ? value.titleize : value
  end

  config.normalizers[:capitalize] = lambda do |value, _options|
    value.is_a?(String) ? value.capitalize : value
  end

  config.normalizers[:downcase] = lambda do |value, _options|
    value.is_a?(String) ? value.downcase : value
  end

  config.normalizers[:upcase] = lambda do |value, _options|
    value.is_a?(String) ? value.upcase : value
  end

  config.normalizers[:number] = lambda do |value, _options|
    value = value.is_a?(String) ? value.gsub(/[^0-9]+/, "") : value
    value.is_a?(String) && value.empty? ? nil : value
  end
end
