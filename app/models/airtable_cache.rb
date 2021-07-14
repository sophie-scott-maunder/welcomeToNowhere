class AirtableCache < ApplicationRecord

  def self.get
    AirtableCache.first.uuid
  end

  def self.set
    AirtableCache.first_or_update
  end

end
