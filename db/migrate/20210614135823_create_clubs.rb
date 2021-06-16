class CreateClubs < ActiveRecord::Migration[6.1]
  def change
    create_table :clubs, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
      t.string :name
      t.string :leader
      t.string :teacher
      t.text :intro
      t.string :url
      t.string :updated_date
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end