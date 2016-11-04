class CreateSubmissionLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :submission_likes do |t|

      t.timestamps
    end
  end
end
