class SessionsController < ApplicationController
  def index
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
  end

  def create
    @session = Session.new(session_params)
    @session.user_id = current_user
    if @session.save
      redirect_to root
    else
      render root, status: unprocessable_entity
    end
  end

  private

  def session_params
    params.require(:session).permit(:info)
  end
end
