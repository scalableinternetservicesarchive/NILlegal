class CreateDareSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :dare_submissions do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :dare, foreign_key: true

      t.timestamps
    end
  end
end
