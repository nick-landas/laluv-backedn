class EnrollmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    before_action :authorize_parlor_enrollment, only: [:destroy]
  
  
    def create
      parlor = Parlor.find(params[:parlor_id])
      parlor.enrollments.create!(fan: current_user)
      render json: parlor, status: :created
    end
  
    def destroy
      membership.destroy
      parlor = Parlor.find(params[:parlor_id])
      render json: parlor, status: :ok
    end
  
    private
  
    def membership
      @membership ||= ParlorEnrollment.find(params[:id])
    end
  
    def authorize_parlor_membership
      render json: { errors: ["Not authorized"] }, status: :unauthorized unless membership.fan_id == current_user.id
    end
  
    def render_not_found
      render json: { errors: ['Please select a parlor from the available choices']}, status: :not_found
    end
  
  end
end
