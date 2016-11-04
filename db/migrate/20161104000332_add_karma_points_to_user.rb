class AddKarmaPointsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :karma_points, :integer, default: 100
  end
end
