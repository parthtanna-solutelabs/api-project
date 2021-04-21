class OrdersController < ApplicationController
    before_action :authorize_request

    def create
        
        @order=Order.new()
        @order.payment_method=params[:payment_method]
        @order.user_id=current_user.id
        @order.dose_id=params[:dose_id]
        @order.pack_id=params[:pack_id]
        @order.address_id=params[:address_id]
        if @order.payment_method != "Cash On Delivery"
            @order.card_id=params[:card_id]
        else
            @order.card_id=1
        end
        @order.medicine_id=params[:medicine_id]
        
        if @order.save!
            #session.clear
            render json: @order
        else
            render json:{message:"Some error occured while placing your order"}
        end

    end
    private
    def order_params
        params.require(:order).permit(:payment_method,:medicine_id,:dose_id,:pack_id,:address_id,:card_id)
    end
end
