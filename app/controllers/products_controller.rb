class ProductsController < ApplicationController
    def index
        @products = Product.select(:id, :name, :manufacturer, :description, :price)
            .order(id: :asc).paginate(page: params[:page])
    end


    def show
        @product = Product.find_by id: params[:id]
        render "products/show", :layout => false
    end
end
