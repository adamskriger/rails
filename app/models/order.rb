class Order < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :item, presence: true

  def add_order(order)
  end

  def remove_order(order)
  end

end
