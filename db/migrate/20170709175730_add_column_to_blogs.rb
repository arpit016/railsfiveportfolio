class AddColumnToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :article_part, :string
  end
end
