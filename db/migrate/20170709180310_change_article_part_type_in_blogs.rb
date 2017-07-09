class ChangeArticlePartTypeInBlogs < ActiveRecord::Migration[5.0]
  def change
    change_column :blogs, :article_part, :text
  end
end
