class CreateOpeningTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :opening_times do |t|
      t.references :place
      t.string :section

      t.timestamps
    end
  end
end
