class AddKarmaToDare < ActiveRecord::Migration[5.0]
  def change
    add_column :dares, :karma_offer, :integer
  end
end
