class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
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

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :area_id
    validates :days_id
  end

  with_options presence: true, inclusion: { in: 300..9_999_999, message: '300〜9,999,999の範囲内で入力してください' }, numericality: true do
    validates :price
  end
end
