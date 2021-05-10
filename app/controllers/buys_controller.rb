class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :contributor_confirmation, only: :index
  before_action :buy_present?, only: :index

  def index
    @buy_ship = BuyShip.new
  end

  def create
    @buy_ship = BuyShip.new(buy_params)
    if @buy_ship.valid?
      pay_item
      @buy_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_ship).permit(:postal_code, :area_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user != @item.user
  end

  def buy_present?
    redirect_to root_path unless @item.buy.present? == false
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'
      )
  end
end
