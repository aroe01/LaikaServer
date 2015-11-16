class ChangeEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.float :lat
      t.float :long
    end
  end
end
