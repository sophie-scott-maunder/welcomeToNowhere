class Airtable
  def self.fetch_homepage_blurb
    Rails
      .cache
      .fetch([self, :fetch_homepage_blurb], expires_in: 10.hours) do
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
  end

  def self.fetch_artists
    Rails
      .cache
      .fetch([self, :fetch_artists], expires_in: 10.hours) do
        Airrecord
          .table(ENV['airtable_key'], 'app47yxhBJJGy9O2V', 'Bands Live')
          .all
          .map do |artist|
            {
              name: artist['Name'],
              image_url: image(artist),
              city:
                if artist['Hometown'].present?
                  artist['Hometown']
                else
                  'Hometown not provided.'
                end,
              description:
                artist['Bio'].present? ? artist['Bio'] : 'Bio not provided.',
              links:
                if artist['Links'].present? &&
                     URI.regexp.match?(artist['Links'])
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
                if artist['Genre'].present?
                  artist['Genre']
                else
                  'Genre not specified.'
                end,
              performer_details:
                if artist['Performer Details'].present?
                  artist['Performer Details']
                else
                  'Performer details not provided.'
                end,
            }
          end
      end
  end

  private

  def self.image(record)
    if record['Portrait Press Shot'].present?
      if record['Portrait Press Shot'][0]['thumbnails'].present?
        record['Portrait Press Shot'][0]['thumbnails']['large']['url']
      end
    end
  end
end
