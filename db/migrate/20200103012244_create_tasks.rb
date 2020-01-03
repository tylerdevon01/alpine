class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :body
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
