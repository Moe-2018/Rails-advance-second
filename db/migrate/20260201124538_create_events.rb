class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.string :organiser_name
      t.string :target_dapartment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
