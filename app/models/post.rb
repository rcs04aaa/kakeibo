class Post < ApplicationRecord

  belongs_to :user
  belongs_to :category
  
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  
  before_save do
    self.amount = self.price * self.quantity
  end
end
