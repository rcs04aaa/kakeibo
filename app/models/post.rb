class Post < ApplicationRecord
  
  belongs_to :user
  belongs_to :favorite, dependent: :destroy
  has_many :categories
  
  def subtotal
    post.price * quantity
  end
  
  def favorited?
    favorites.where(user_id: user.id).exists?
  end
  
end
