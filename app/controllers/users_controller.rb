class UsersController < ApplicationController
    before_action :authorize_request
    before_action :admin_only ,only: :index
    def index
        @users = User.all
        render json:@users
    end
end
