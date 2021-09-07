module Airtable
  def self.fetch(resource)
    # caches if in development
    # return ENV['RACK_ENV'] == 'development' && self.send(resource)

    Rails
      .cache
      .fetch([self, resource], expires_in: 10.hours) { self.send(resource) }
  end

  def self.upcoming_acts
    Airrecord
      .table(
        ENV['airtable_key'],
        'app47yxhBJJGy9O2V',
        'Eyegum wednesday content',
      )
      .all
      .map(&:fields)
  end

  def self.latest_news
    Airrecord
      .table(ENV['airtable_key'], 'app47yxhBJJGy9O2V', 'Eyegum news items')
      .all
      .map do |item|
        [item.fields['news item'], item.fields['copy'], image(item, 'photo')]
      end
  end

  def self.homepage_blurb
    Airrecord
      .table(
        ENV['airtable_key'],
        'app47yxhBJJGy9O2V',
        'Eyegum website home page content',
      )
      .all
      .first
      .fields[
      'home page blurb'
    ]
  end

  def self.artists
    Airrecord
      .table(ENV['airtable_key'], 'app47yxhBJJGy9O2V', 'Bands Live')
      .all
      .map do |artist|
        {
          name: artist['Name'],
          image_url: image(artist, 'Portrait Press Shot'),
          city:
            if artist['Hometown'].present?
              artist['Hometown']
            else
              'Hometown not provided.'
            end,
          description:
            artist['Bio'].present? ? artist['Bio'] : 'Bio not provided.',
          links:
            if artist['Links'].present? && URI.regexp.match?(artist['Links'])
              URI.regexp.match(artist['Links'])[0]
            else
              'Links not provided.'
            end,
          long_description:
            if artist['Bio (Extended)'].present?
              artist['Bio (Extended)']
            else
              'Extended bio not provided.'
            end,
          genre:
            artist['Genre'].present? ? artist['Genre'] : 'Genre not specified.',
          performer_details:
            if artist['Performer Details'].present?
              artist['Performer Details']
            else
              'Performer details not provided.'
            end,
        }
      end
  end

  private

  def self.image(record, identifier)
    if record[identifier].present?
      if record[identifier][0]['thumbnails'].present?
        record[identifier][0]['thumbnails']['large']['url']
      end
    end
  end
end
