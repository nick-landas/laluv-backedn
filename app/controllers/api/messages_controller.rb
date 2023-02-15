class MessagesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def show
    message = current_user.messages.find(params[:id])
    render json: message, status: :ok
  end

  def create
    enrollment = current_user.enrollments.find_by(id: params[:parlor_id])
    if enrollment
      message = current_user.messages.create!(message_params)
      render json: message, status: :created
    else
      render json: { errors: ["Not authorized"]}, status: :unauthorized
    end
  end

  def update
    message = current_user.messages.find(params[:id])
    message.update!(update_message_params)
    render json: message, status: :ok
  end

  def destroy
    message = current_user.messages.find(params[:id])
    message.destroy
    render json: message, status: :ok
  end

  private

  def render_not_found
    render json: { errors: ["The message does not exist"] }, status: :not_found
  end
  
  def message_params
    params.permit(:content, :parlor_id)
  end

  def update_message_params
    params.permit(:content)
  end
end
