class AddPhotoUrl < ActiveRecord::Migration
  def change
  	change_table :events do |t|      
      t.string :photo_urls
    end
  end
end
