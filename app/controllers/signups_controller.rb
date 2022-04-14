class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
    sign=Signup.create!(xyz)
    render json: sign.activity,  status: 201
    end

    private

    def xyz
        params.permit(:time, :camper_id, :activity_id)
    end

    def render_unprocessable_entity_response
        render json: { errors: ["validation errors"]},status: 422
    end

end
