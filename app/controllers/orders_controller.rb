class OrdersController < ApplicationController
    before_action :authorize_request

    def create
        @order=Order.create!(order_params)
        if @order.payment_method =="Card" && @order
            if !@order.card_id
                render json:{message:"Please Select Card"}
            else
                render json: @order
            end    
        else
            render json:{message:"Some error occured while placing your order"}
        end
    end
    
    private
    def order_params
        params.require(:order).permit(:payment_method,:medicine_id,:dose_id,:pack_id,:address_id,:card_id,:user_id)
    end
end
