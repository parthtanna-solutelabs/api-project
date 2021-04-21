class PacksController < ApplicationController
    before_action :authorize_request
    before_action :admin_only, only: [:index,:show,:create,:edit,:update,:destroy]
    before_action :patient_only, only: [:select_payment_method,:get_payment_method,:show_addresses,:get_address]
    def index
        @packs=Pack.all
        render json: @packs
      end
    
      def show
        @pack=Pack.find(params[:id])
        render json: @pack
      end

      def create
        dose = Dose.find(params[:dose_id])
        
        @pack = dose.packs.build(pack_params)
        #@medicine.medical_condition_id=params[:medical_condition_id]
        
        if @pack.save
          render json: {pack:PackSerializer.new(@pack), message:"Sucessfully created"}
        else
          render json: {error:"OFFFoo Pack not created"}, status: :unprocessable_entity
        end
      end
      def edit
        @pack = Pack.find(params[:id])
        render json: @pack
      end

      def update
        @pack = Pack.find(params[:id])
        if @pack.update(pack_params)
          render json: {pack:PackSerializer.new(@pack), message:"Sucessfully updated"}
        else
          render json: {error:"OFFFoo Pack not updated"}, status: :unprocessable_entity
        end
      end

      def destroy
        @pack = Pack.find(params[:id])
        if @pack.destroy
          render json: {pack:PackSerializer.new(@pack), message:"Sucessfully deleted"}
        else
          render json: {error:"OFFFoo Pack not deleted"}, status: :unprocessable_entity
        end
      end

      

      def select_payment_method
        @pack=Pack.find(params[:id])
        @dose_id=params[:dose_id]
        @medicine_id=params[:medicine_id]
        session[:pack_id]=@pack.id
        render json: {payment_method:[{id:1,method:"Cash On Delivery"},{id:2,method:"Card"}]}
      end

      def get_payment_method
        session[:payment_method]=params[:method]
        if params[:method]=="Cash On Delivery"
            render json: current_user, serializer: UserSerializer, show_address: true
        else
            render json: current_user, serializer: UserSerializer, show_card: true
        end
      end
    
      def show_addresses
        if params[:payment_method]!="Cash On Delivery"
            @card=Card.find(params[:id])
            @pack_id=params[:pack_id]
            @dose_id=params[:dose_id]
            @medicine_id=params[:medicine_id]
            render json: current_user, serializer: UserSerializer, show_address: true
        end
        #render json: @dose, show_children: true
      end

      def get_address
        @address=Address.find(params[:id])
        @address_id=@address.id
        @card_id=params[:card_id]
        @pack_id=params[:pack_id]
        @dose_id=params[:dose_id]
        @medicine_id=params[:medicine_id]
        session[:address_id]=@address.id
        #set_session("address_id",@address.id)
        render json: {message:"You can now click on Place Order to confirm your Order"}
      end

      private
      def pack_params
        params.require(:pack).permit(:size,:price)
      end
end
