class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :category
      t.text :content

      t.timestamps
    end
  end
end
