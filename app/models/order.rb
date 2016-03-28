class Order < ActiveRecord::Base

  belongs_to :user

  validates :item, presence: true

  def add_order(username)
    user = User.where(username: username).first
      user.orders.create(item: order.item)
  end

  def remove_order(order)
  end

end
