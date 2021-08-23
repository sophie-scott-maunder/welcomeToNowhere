class Airtable
  def self.latest_news
    # Rails
    #   .cache
    #   .fetch([self, :latest_news], expires_in: 10.hours) do
    Airrecord
      .table(ENV['airtable_key'], 'app47yxhBJJGy9O2V', 'Eyegum news items')
      .all
      .map do |item|
        [item.fields['news item'], item.fields['copy'], image(item, 'photo')]
      end
    # end
  end

  def self.homepage_blurb
    # Rails
    #   .cache
    #   .fetch([self, :homepage_blurb], expires_in: 10.hours) do
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
    # end
  end

  def self.artists
    # Rails
    #   .cache
    #   .fetch([self, :artists], expires_in: 10.hours) do
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
    # end
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
