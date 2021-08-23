class EyegumController < ApplicationController
  layout 'eyegum'

  def index
    @latest_news = Airtable.latest_news.slice(0, 2)
    @blurb = Airtable.homepage_blurb
  end

  def free_wednesdays; end
end
