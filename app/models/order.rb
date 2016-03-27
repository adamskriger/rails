class Order < ActiveRecord::Base
  # belongs_to :party
  validates :item, presence: true

end
