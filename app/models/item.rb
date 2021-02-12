class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :ship_cost
  belongs_to :prefecture
  belongs_to :ship_day


  belongs_to :user
  has_one :purchase_management, dependent: :destroy

  has_one_attached :image



  with_options presence: true do
    validates :name
    validates :description
      with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :ship_cost_id
      validates :prefecture_id
      validates :ship_day_id
      end
   
    validates :price, format: {with: /\A[0-9]+\z/ }
    validates :image
    
    
    

  end






end