class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
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

  with_options presence: true, inclusion: { in: 300..9999999, message: '300〜9,999,999の範囲内で入力してください' }, format: { with: /\A[0-9]+\d/, message: '半角数字で入力してください' } do
    validates :price
  end
end