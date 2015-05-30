class HomeController < ApplicationController
  skip_before_filter :authenticate!

  def home; end
end
