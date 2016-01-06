class BadgesController < ApplicationController
  before_action :set_badge, only: [:update, :destroy]

  def create
    @badge = badge.new(badge_params)
    if @badge.save
      render json: @badge, status: :created, location: @badge
    else
      err
    end
  end

  def update
    p "OUR PARAMS:"
    if badge_params["voteType"] == "up"
      @badge.update(points: @badge.points + 1 )
    elsif badge_params["voteType"] == "down"
      @badge.update(points: @badge.points - 1 )
    else
      err
    end
  end

  def destroy
    @badge.destroy
    head :no_content
  end

  private
    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.permit(:points, :user_id, :title, :id, :voteType)
    end

    def err
      render json: @badge.errors, status: :unprocessable_entity
    end
end
