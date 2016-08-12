class AddVibeToEvent < ActiveRecord::Migration
  def change
  	change_table :events do |t|      
      t.string :vibe
      t.string :activity
	  end
  end
end
