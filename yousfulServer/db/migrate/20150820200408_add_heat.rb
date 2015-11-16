class AddFileUrl < ActiveRecord::Migration
  def change
  	change_table :events do |t|      
      t.float :heat
    end
  end
end
