class AddLocationNameToEvents < ActiveRecord::Migration
  def change
  	change_table :events do |t|      
      t.string :locationName
      t.integer :startTime
      t.integer :endTime
      t.string :description
    end
  end
end
