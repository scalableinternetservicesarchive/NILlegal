class AddDareWinnerIdToDare < ActiveRecord::Migration[5.0]
  def change
    add_reference :dares, :dare_winner
    add_foreign_key :dares, :dare_submissions, column: :dare_winner
  end
end
