class Api::V1::CreaturesController < ApplicationController
  after_action :authenticate_user!, except: [:index]

  def index
    @creatures = Creature.all
    render json: @creatures
  end

end
