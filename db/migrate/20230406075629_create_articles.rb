class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :brief
      t.text :body
      t.integer :view_count, default: 0

      t.timestamps
    end
  end
end
