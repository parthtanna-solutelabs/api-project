class DiseasesController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :admin_only, only: [:index,:show]


    def index
        @diseases=Disease.all
        render json: @diseases, show_children: false
    end

    def show
        @disease=Disease.find(params[:id])
        render json: @disease, show_children: false
    end

    def get_medical_conditions
        @disease=Disease.find(params[:id])
        session[:disease_id]=@disease.id
        
        render json: @disease, show_children: true
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
