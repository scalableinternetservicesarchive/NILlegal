class Dare < ApplicationRecord
  belongs_to :user
  has_many  :comments
  has_many :dare_submissions, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 140 }
  validates :karma_offer, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: :max_karma_points}
  
  
  after_create :transfer_points

  
  def add_karma(points)
    self.karma_offer += points
  end
  
  def transfer_points
    #self.transaction do
      self.user.remove_karma(self.karma_offer)
    #  puts "Fired once?"
    #end
  end
  
  private
  
    def max_karma_points
      return self.user.karma_points
    end
    
   
  
  
  
  
  
end
