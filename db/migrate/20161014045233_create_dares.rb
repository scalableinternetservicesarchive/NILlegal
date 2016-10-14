class CreateDares < ActiveRecord::Migration[5.0]
  def change
    create_table :dares do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
