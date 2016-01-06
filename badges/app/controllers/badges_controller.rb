class BadgesController < ApplicationController
	before_action :set_badge only:[:update, :destroy]

	def create
		@badge = badge.new(badge_params)
		render json: @badge, status: :created, location: @badge
	end

	def destroy
		@badge.destroy
		head :no_content
	end

	def update
		if @badge.update(badge_params)
			head :no_content
		else
			err
		end
	end

	private

	def set_badge
		@badge = badge.find(params[:id])
	end

	def badge_params
		params.permit(:points, :owner_id, :title, :id)
	end

	def err
		render json: @badge.errors, status: :unprocessable_entity
	end
	end


end
