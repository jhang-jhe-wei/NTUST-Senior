class CreateNotifies < ActiveRecord::Migration[6.1]
  def change
    create_table :notifies do |t|
      t.string :name
      t.string :intro

      t.timestamps
    end
  end
end
