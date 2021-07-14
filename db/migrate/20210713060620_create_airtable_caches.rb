class CreateAirtableCaches < ActiveRecord::Migration[6.1]
  def change
    create_table :airtable_caches do |t|
      t.string :uuid

      t.timestamps
    end
  end
end
