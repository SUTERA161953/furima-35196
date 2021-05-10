class BuyShip
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :area_id,      numericality: { other_than: 1, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :phone_number, length: {minimum: 10, message: "is too short"},
                             numericality: {only_integer: true, message: "is invalid. Input only number"}
    validates :user_id
    validates :item_id
  end
    
  validates :phone_number, length: {maximum: 11, message: "is too long"}

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Ship.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building: building, phone_number: phone_number, buy_id: buy.id)
  end
end