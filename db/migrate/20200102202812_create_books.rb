class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.references :author, foreign_key: true
      t.integer :pages
      t.integer :publication_year

      t.timestamps
    end
  end
end
