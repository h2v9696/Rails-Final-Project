class ProductsController < ApplicationController
    def index
        @products = Product.select(:id, :name, :manufacturer, :description, :price)
            .order(id: :asc).paginate(page: params[:page], per_page: 15)
    end

    def show
        @product = Product.find_by id: params[:id]
    end
end