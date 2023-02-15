class ParlorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  before_action :parlor_authorization
  skip_before_action :parlor_authorization, only: [:index]

  def index
    parlors = Parlor.all
    render json: parlors, status: :ok
  end

  def show
    parlor = Parlor.find(params[:id])
    render json: parlor, status: :ok, serializer: ParlorShowSerializer, include: ['messages', 'messages.fan', 'enrollments', 'members']
  end 

  private

  def render_not_found
    render json: { errors: ["Parlor does not exist"] }, status: :not_found
  end

  # private

  def is_member?
    Parlor.find(params[:id]).members.include? current_user
  end

  def parlor_authorization
    render json: { errors: ["Not authorized"]}, status: :unauthorized unless is_member?
  end
end
