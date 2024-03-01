class Api::V1::EquipsController < ApplicationController
  after_action :authenticate_user!, except: [:index]

  def index
    @equips = Equip.all
    render json: @equips
  end

end
