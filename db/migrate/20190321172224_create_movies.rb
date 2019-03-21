class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year
      t.string :director
      t.string :producer
      t.integer :episode

      t.timestamps
    end
  end
end
