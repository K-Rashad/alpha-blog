class AddLikesToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :likes,:int
  end
end
