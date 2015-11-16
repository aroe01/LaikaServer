class AddFileUrl < ActiveRecord::Migration
  def change
  	change_table :events do |t|
      #t.serialize :photo_urls
    end
  end
end
