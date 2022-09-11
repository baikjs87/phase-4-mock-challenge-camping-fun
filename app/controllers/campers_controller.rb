class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show
        if Camper.find(params[:id])
            camper = Camper.find(params[:id])
            render json: camper, include: activities, status: :ok
        else
            render json: { errors: "Camper not found" }, status: :unprocessable_entity
        end
    end

    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper, status: :created
        else
            render json: { errors: "validation errors" }, status: :unprocessable_entity
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

end
