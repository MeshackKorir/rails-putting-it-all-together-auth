class SessionsController < ApplicationController
    def create
      user = User.find_by(username: params[:username])
  
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user, except: :password_digest
      else
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  
    def destroy
      if logged_in?
        session.delete(:user_id)
        head :no_content
      else
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  end
  