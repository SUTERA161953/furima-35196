class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :buy
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :area
  belongs_to :days
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end
  validates :price, presence: true, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' },
                    inclusion: { in: 300..9_999_999, message: 'is out of setting range' }
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :area_id
    validates :days_id
  end
end
