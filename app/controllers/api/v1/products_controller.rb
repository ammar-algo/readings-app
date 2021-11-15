class Api::V1::ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin, only: [:destroy, :update]
    def index 
        @products = Product.all
        render json:@products 
    end
    
    def create 
        @product = Product.new(product_params)

         @product.save 
        render json: @product
       
        
    end

    def destroy 

        # @product = Product.find(params[:id])
    #  user=    current_user
     
    #   binding.pry
     
        if  @admin
          
            @product.destroy
        render json: @product
        
    else
        render json:"nothing"
    end
   
            
    end

    def show
        @product = Product.find(params[:id])
        
    
        render json:@product
    end
    
    def update 
        @product = Product.find(params[:id])
        if @product
            @product.update(product_params)
            render json: {message: "Successfully updated.", data: @product} , status:200
        else 
            render json: {error: "unable to update product"}
            # status:400
        end
    end

    private 

    def product_params 
        params.permit(:image, :price, :ratings, :user_id)
    end

    def admin
        @product = Product.find(params[:id])
      @admin =   @product && current_user.role == "admin"
    end
end
