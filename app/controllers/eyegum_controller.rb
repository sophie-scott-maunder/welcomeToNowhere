class EyegumController < ApplicationController
  layout 'eyegum'

  def index
    @latest_news = %w[one two]
  end
end
