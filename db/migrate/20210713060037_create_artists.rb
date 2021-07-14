class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.text :link
      t.text :members
      t.string :city

      t.timestamps
    end
  end
end
