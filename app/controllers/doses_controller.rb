class DosesController < ApplicationController
    before_action :authorize_request
    before_action :admin_only, only: [:index,:show,:create,:edit,:update,:destroy]
    
    def index
        @doses=Dose.all
        render json: @doses
      end
    
      def show
        @dose=Dose.find(params[:id])
        render json: @dose
      end

      def create
        medicine = Medicine.find(params[:medicine_id])
        
        @dose = medicine.doses.build(dose_params)
        #@medicine.medical_condition_id=params[:medical_condition_id]
        
        if @dose.save
          render json: {dose:DoseSerializer.new(@dose), message:"Sucessfully created"}
        else
          render json: {error:"OFFFoo Dose not created"}, status: :unprocessable_entity
        end
      end
      def edit
        @dose = Dose.find(params[:id])
        render json: @dose
      end

      def update
        @dose = Dose.find(params[:id])
        if @dose.update(dose_params)
          render json: {dose: DoseSerializer.new(@dose), message:"Sucessfully updated"}
        else
          render json: {error:"OFFFoo Dose not updated"}, status: :unprocessable_entity
        end
      end

      def destroy
        @dose = Dose.find(params[:id])
        if @dose.destroy
          render json: {dose: DoseSerializer.new(@dose), message:"Sucessfully deleted"}
        else
          render json: {error:"OFFFoo Dose not deleted"}, status: :unprocessable_entity
        end
      end
    
      def get_packs
        @dose=Dose.find(params[:id])
        @medicine_id=params[:medicine_id]
        session[:dose_id]=@dose.id
        render json: @dose, show_children: true
      end

      private
      def dose_params
        params.require(:dose).permit(:weight)
      end
end
