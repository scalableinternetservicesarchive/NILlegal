class CreateCommentLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_likes do |t|

      t.timestamps
    end
  end
end
