class Api::V1::ItemsController < ApplicationController
  after_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
    render json: @items
  end

end
