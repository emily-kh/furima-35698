class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|

      t.timestamps
    end
  end
end
#ActiveHashを導入しました。Articleテーブルの中で、Genreモデル（ActiveHash）のidを外部キーとして管理することで、その記事に紐付いたジャンルの取得が実現できます。編集したら、rails db:migrateを実行してデータベースに反映