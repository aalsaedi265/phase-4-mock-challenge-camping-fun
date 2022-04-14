class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def index
        render json: Activity.all
    end

    def destroy
        act=Activity.find(params[:id])
        act.destroy
        
    end

    private

    def not_found
        render json: { error: "Activity not found"}, status: :not_found
    end
end
