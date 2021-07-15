class ArtistsController < ApplicationController

  def index
    @artists = artists
    @colours = colours
  end

  def show
    @artists = artists
    @colours = colours
    @index = params[:id].to_i
  end

  private

  def image(record)
    if record['Portrait Press Shot'].present?
      if record['Portrait Press Shot'][0]['thumbnails'].present?
        record['Portrait Press Shot'][0]['thumbnails']['large']['url']
      end
    end
  end

  def artists
    Airrecord.table(Rails.application.credentials.airtable_key, 'appQU5xzDT5zzQdtO', 'Artists').all.map do |artist|
      {
        name: artist['Performer/Band Name'],
        image_url: image(artist),
        city: artist['Hometown'].present? ? artist['Hometown'] : 'Hometown not provided.',
        description: artist['Bio'].present? ? artist['Bio'] : 'Bio not provided.',
        genre: artist['Genre'].present? ? artist['Genre'] : 'Genre not specified.',
        performer_details: artist['Performer Details'].present? ? artist['Performer Details'] : 'Performer details not provided.',
      }
    end
  end

  def colours
    [
      'rgba(243, 166, 131,1.0)', 'rgba(247, 215, 148,1.0)', 'rgba(119, 139, 235,1.0)', 'rgba(231, 127, 103,1.0)', 'rgba(207, 106, 135,1.0)', 'rgba(120, 111, 166,1.0)', 'rgba(248, 165, 194,1.0)', 'rgba(99, 205, 218,1.0)', 'rgba(234, 134, 133,1.0)', 'rgba(89, 98, 117,1.0)'
    ]
  end
end
