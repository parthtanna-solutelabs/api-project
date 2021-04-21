# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :json
  #before_action :authorize_request, except: :create
  

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
    @user = User.find_by_email(params[:email])
    if @user && @user.valid_password?(params[:password])
      
      token = encode(user_id:@user.id)
      
      render json: { user: UserSerializer.new(@user), token: token 
                     }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
   end

  


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
