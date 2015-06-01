module ApplicationHelper
  FLASH_CLASSES = {
    success: "success", notice: "info", info: "info", error: "danger",
    alert: "danger"
  }

  def flash_messages
    flash.collect do |key, msg|
      content_tag :p, class: "alert alert-#{FLASH_CLASSES[key.to_sym]}" do
        content_tag(:a, "x",
          class: "close", href: "#", data: { dismiss: "alert" }) + msg
      end
    end.join.html_safe
  end

  def seconds_to_time(seconds)
    format("%02d:%02d", seconds / 3600, seconds / 60 % 60)
  end

  def datetime_to_time(datetime)
    datetime.strftime("%H:%M")
  end
end
