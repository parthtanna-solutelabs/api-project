class UsersController < ApplicationController
    before_action :authorize_request
    before_action :admin_only ,only: :index
    def index
        @users = User.all
        render json:@users
    end

    def admin_only
        if !current_user.admin?
            render json:{error:"Only admin can acccess"}, status: :unauthorized
        end
      end

      def patient_only
        if current_user.admin?
            render json:{error:"Only patient can acccess"}, status: :unauthorized
        end
      end
end
