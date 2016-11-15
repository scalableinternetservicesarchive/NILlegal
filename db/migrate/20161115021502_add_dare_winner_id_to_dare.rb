class AddDareWinnerIdToDare < ActiveRecord::Migration[5.0]
  def change
    add_reference :dares, :winning_submission
    add_foreign_key :dares, :dare_submissions, column: :winning_submission
  end
end
