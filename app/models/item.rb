class Item < ApplicationRecord
  belongs_to :department

  def instock_alert
    if self.instock == true
      "We have some #{self.name} in stock"
    else
      "Sorry #{self.name} are out of stock"
    end
  end
end
