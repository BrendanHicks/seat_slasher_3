class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :user_id
      t.integer :genre_id

      t.timestamps

    end
  end
end
