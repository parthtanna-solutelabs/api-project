class MedicalConditionsController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :admin_only, only: [:index,:show]
  def index
    @medical_conditions=MedicalCondition.all
    render json: @medical_conditions
  end

  def show
    @medical_condition=MedicalCondition.find(params[:id])
    render json: @medical_condition
  end

  def get_medicines
    @medical_condition=MedicalCondition.find(params[:id])
    session[:medical_condition_id]=@medical_condition.id
    render json: @medical_condition, show_children: true
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
