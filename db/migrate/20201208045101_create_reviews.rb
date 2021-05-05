class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :opus_title, null: false
      t.string :author_name, null: false
      t.string :authors_website
      t.text :text, null:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
