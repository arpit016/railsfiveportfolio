class CreateCategorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :categorizations do |t|
      t.references :blogs, foreign_key: true
      t.references :categories, foreign_key: true

      t.timestamps
    end
  end
end
