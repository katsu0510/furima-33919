class ShipCost < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '着払い' },
    { id: 2, name: '出品者負担' },
    
  ]
  
include ActiveHash::Associations
has_many :items

end