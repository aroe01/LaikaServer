class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.text :notes
      t.float :lat
      t.float :long
      t.timestamps
    end
  end
end
