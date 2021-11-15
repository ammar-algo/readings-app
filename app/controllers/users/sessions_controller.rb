# frozen_string_literal: true

class Users::SessionsController < ApplicationController
  
# attr_reader :current_user
# def new
#   if 
#   current_user
  
#   binding.pry
  
#   end
#   render json: {username: current_user.user_name}
# end
    
  # binding.pry
  
  


  def create
    
    # binding.pry
    
    user = User.find_by_email(user_params[:email])

    if user && user.valid_password?(user_params[:password])
      token = user.generate_jwt
      @id = user.id 
      @username = user.user_name
      @role = user.role
     
      # current_user = user
      render json: {token: token, id: @id, user_name: @username, role:@role}
    else
     
      render json:   {message:"invalid credendtials"}
    end
  end

  # def destroy
  #      render json: "Bye Bye"
  #  end
end




private

def user_params
  params.permit( :email, :password)
end
#   respond_to :json

#   private

#   def respond_with(resource, _opts = {})
#     render json: { message: 'You are logged in.' }, status: :ok
#   end

#   def respond_to_on_destroy
#     log_out_success && return if current_user

#     log_out_failure
#   end

#   def log_out_success
#     render json: { message: "You are logged out." }, status: :ok
#   end

#   def log_out_failure
#     render json: { message: "Hmm nothing happened."}, status: :unauthorized
#   end
# end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
# end
