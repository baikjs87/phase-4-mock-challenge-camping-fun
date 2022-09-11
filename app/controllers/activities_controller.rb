class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities, status: :ok
    end

    def destroy
        if activity = Activity.find(params[:id])
            activity.destroy
            head :no_content
        else
            render json: { errors: "Activity not found" }, status: :unauthorized
        end
    end
end
