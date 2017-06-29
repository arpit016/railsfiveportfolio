class DropTableTopics < ActiveRecord::Migration[5.0]
  def change
    drop_table :topics do |t|
      t.string :title
      t.timestamps
    end
  end
end
