class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :data
      t.string :visit
      t.string :user
      t.string :name
      t.string :description
      t.string :time
      t.string :report
    end
  end
end
