class MedicinesController < ApplicationController
  before_action :authorize_request
  before_action :admin_only, only: [:index,:show,:create,:edit,:update,:destroy]
  before_action :patient_only, only: :get_doses
    def index
        @medicines=Medicine.all
        render json: @medicines
      end
    
      def show
        @medicine=Medicine.find(params[:id])
        render json: @medicine
      end

      def edit
        @medicine = Medicine.find(params[:id])
        render json: @medicine
      end

      def update
        @medicine = Medicine.find(params[:id])
        if @medicine.update(medicine_params)
          render json: {medicine: MedicineSerializer.new(@medicine), message:"Sucessfully updated"}
        else
          render json: {error:"OFFFoo Medicine not updated"}, status: :unprocessable_entity
        end
      end

      def create
        
        medical_condition = MedicalCondition.find(params[:medical_condition_id])
        
        @medicine = medical_condition.medicines.build(medicine_params)
        #@medicine.medical_condition_id=params[:medical_condition_id]
        
        if @medicine.save
          render json: {medicine:MedicineSerializer.new(@medicine), message:"Sucessfully created"}
        else
          render json: {error:"OFFFoo Medicine not created"}, status: :unprocessable_entity
        end
      end

      def destroy
        @medicine= Medicine.find(params[:id])
        if @medicine.destroy
          render json: {medicine:MedicineSerializer.new(@medicine), message:"Sucessfully deleted"}
        else
          render json: {error:"OFFFoo Medicine not deleted"}, status: :unprocessable_entity
        end
      end
      
    
      def get_doses
        @medicine=Medicine.find(params[:id])
        
        session[:medicine_id]=@medicine.id
        
        render json: @medicine, show_children: true
      end

      def admin_only
        
        if !@current_user.admin?
            render json:{error:"Only admin can acccess"}, status: :unauthorized
        end
      end

      def patient_only
        if @current_user.admin?
            render json:{error:"Only patient can acccess"}, status: :unauthorized
        end
      end
      private
      def medicine_params
        params.require(:medicine).permit(:name,:side_effects)
      end
end
