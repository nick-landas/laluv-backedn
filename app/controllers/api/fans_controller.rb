class FansController < ApplicationController
    skip_before_action :authorize, only: [:create]
  before_action :authorize_fan_update, only: [:update]
  
  def show
    render json: current_user, status: :ok
  end

  def create
    fan = Fan.create!(fan_params)
    session[:fan_id] = fan.id
    render json: fan, status: :created
  end

  def update
    current_user.update!(update_fan_params)
    render json: current_user, status: :ok
  end

  def profile
    render json: current_user, status: :ok, serializer: FanProfileSerializer
  end

  private

  def authorize_fan_update
    render json: { errors: ["Not authorized"] }, status: :unauthorized unless current_user.id == params[:id].to_i
  end

  def fan_params
    params.permit(:username, :password, :password_confirmation, :image_url)
  end

  def update_fan_params
    params.permit(:image_url)
  end
end
