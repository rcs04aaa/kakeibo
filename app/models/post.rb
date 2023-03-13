class Post < ApplicationRecord
  
  belongs_to :user
  belongs_to :favorite, dependent: :destroy
  
  def favorited?
    favorites.where(user_id: user.id).exists?
  end
  
end
