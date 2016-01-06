class BadgesController < ApplicationController
  def create
    @badge = badge.new(badge_params)
    if @badge.save
      render json: @badge, status: :created, location: @badge
    else
      err
    end
  end

  def update
    if @badge.update(badge_params)
      head :no_content
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
      @badge = badge.find(params[:id])
    end

    def badge_params
      params.permit(:points, :user_id, :title, :id)
    end

    def err
      render json: @badge.errors, status: :unprocessable_entity
    end
end
