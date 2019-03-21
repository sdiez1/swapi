class CreatePersonas < ActiveRecord::Migration[5.2]
  def change
    create_table :personas do |t|
      t.string :name
      t.integer :height
      t.integer :mass
      t.string :hair_color
      t.string :skin_color
      t.string :eye_color
      t.string :birth_year
      t.string :gender
      t.string :homeworld
      t.string :films

      t.timestamps
    end
  end
end
