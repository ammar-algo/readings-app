class Api::V1::ShopsController < ApplicationController

    def index 
        if current_user.shop == nil
            render json: "no items to show"
        else
            @shop_products = current_user.shop.products
            # binding.pry
            render json: @shop_products
        end
    end
    
    def create 
        
       
        @product = Product.find(params[:product_id])
    #    @down = current_user.shop.products if current_user.shop.present? && current_user.shop.products.any?
       @id = @product.id
    # #    binding.pry
    #   @che =  @down.each {|i| if i == @product
    #        true 
    #   else 
    #       false
    #   end
    # }
     
    #  binding.pry
     
    #  !current_user.shop.present?
        if current_user.shop === nil
           new_shop = Shop.create(user_id: current_user.id)
        #    binding.pry
           new_shop.products << @product
           render json: new_shop.products

        elsif current_user.shop.products .include? @product
                    render json:   {current_user:current_user.shop.products, repeat:"already"} 
         else
            @check = current_user.shop.products
            @check.push(@product)
            render json:{current_user:@check} 
        end
           
            
   
      
    end

    def destroy 
        @product = Product.find(params[:id])
       
       @delete = current_user.shop.products
       
       
       
       id = @product.id
      
       @delete.delete(id)
       @delete
      
    #    current_user
    #    binding.pry
       render json: @delete
            
    end

    def show
        @cart = Shop.find(params[:id])
        
    
        render json:@cart
    end

    def update 
        @cart = Shop.find(params[:proid])
        if @cart.update(cart_params)
            render json: {message: "Successfully updated.", data: @cart} , status:200
        else 
            render json: {error: "unable to update product"}, status:400
        end
    end

    private 

    def cart_params 
        params.permit( :image, :price, :ratings, :user_id, :product_id)
    end

end

