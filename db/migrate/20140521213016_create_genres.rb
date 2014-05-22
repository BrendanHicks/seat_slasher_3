class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :genre_name
      t.text :example

      t.timestamps

    end
  end
end
