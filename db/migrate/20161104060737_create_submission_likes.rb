class CreateSubmissionLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :submission_likes do |t|
      t.references :user, foreign_key: true
      t.references :submission, foreign_key: true
      
      t.timestamps
    end
  end
end
