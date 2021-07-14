class ArtistsController < ApplicationController
  def index
    # a = Airrecord.table('keyFdQPlI3kMFutdY', 'appQU5xzDT5zzQdtO', 'Artists').all
    @artists = Airrecord.table('keyFdQPlI3kMFutdY', 'appQU5xzDT5zzQdtO', 'Artists').all.map do |artist|
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

  private

  def image(record)
    if record['Portrait Press Shot'].present?
      if record['Portrait Press Shot'][0]['thumbnails'].present?
        record['Portrait Press Shot'][0]['thumbnails']['large']['url']
      end
    end
  end
end
