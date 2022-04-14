class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    before_action :find_spot, only: [:show]

    def index
        render json: Camper.all
    end

    def show
        # camper=Camper.find(params[:id])
        render json: @camper, serializer: CamperActivitiesSerializer
    end

    def create
        camper = Camper.create!(acticity)
        render json: camper, status: :created
    end

    private

    def find_spot
        @camper= Camper.find(params[:id])
     end
 

    def acticity
        params.permit(:name, :age)
    end

    def render_unprocessable_entity_response
        render json: { errors: ["validation errors"]},status: 422
    end

    def not_found
        render json: { error: "Camper not found"}, status: :not_found  
    end
end
