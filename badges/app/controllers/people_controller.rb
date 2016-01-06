class PeopleController < ApplicationController
	before_action :set_person, only:[:show, :update, :destroy]

	def index
		@people = Person.all
		render json: @people
	end

	def show
		render json: @person
	end

	def create
		@person = Person.new(person_params)
		render json: @person, status: :created, location: @person
	end

	def update
		if @person.update(person_params)
			head :no_content
		else
			err
		end
	end

	def destroy
		@person.destroy
		head :no_content
	end

	private

	def set_person
		@person = Person.find(params[:id])
	end

	def person_params
		params.permit(:name)
	end

	def err
		render json: @person.errors, status: :unprocessable_entity
	end



end
