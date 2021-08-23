class EyegumController < ApplicationController
  layout 'eyegum'

  def index
    @latest_news = %w[one two]
    @blurb = Airtable.fetch_homepage_blurb
  end
end
