class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'スポーツ' },
    { id: 3, name: '家電' },
    { id: 4, name: 'インテリア' },
    { id: 5, name: '書籍' },
    { id: 6, name: 'アウトドア' },
    { id: 7, name: 'オフィス' },
    { id: 8, name: '食品' },
    { id: 9, name: 'キッチン' },
    { id: 10, name: 'その他' }
  ]
  
include ActiveHash::Associations
has_many :items

end