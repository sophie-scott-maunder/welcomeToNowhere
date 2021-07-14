class SyncArtistsJob < ApplicationJob
  def perform
    artists = Airrecord.table("keyFdQPlI3kMFutdY", "appQU5xzDT5zzQdtO", "Artists")

    return if cache_blown?(artists)

  end

  def cache_blown?(records)
    true
  end
end