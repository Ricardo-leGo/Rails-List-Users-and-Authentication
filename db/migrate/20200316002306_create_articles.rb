class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :nrz
      t.string :rfc
      t.string :email
      t.string :contactuser

      t.timestamps
    end
  end
end
