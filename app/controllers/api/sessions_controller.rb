class Api::SessionsController < ApplicationController
    skip_before_action :authorize, only: [:create]
  
    def create
      fan = Fan.where('lower(username) = ?', params[:username].downcase).first
      if fan&.authenticate(params[:password])
        session[:fan_id] = fan.id
        render json: fan, status: :created
      else
        render json: { errors: ['Invalid username or password'] }, status: :unauthorized
      end
    end
  
    def destroy
      session.delete :fan_id
      head :no_content
    end
  end