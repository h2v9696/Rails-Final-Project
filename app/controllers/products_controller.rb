class ProductsController < ApplicationController
    def index
        @products = Product.select(:id, :name, :manufacturer, :description, :price)
            .order(id: :asc).paginate(page: params[:page], per_page: 15)
    end


    def show
        @product = Product.find_by id: params[:id]
        render "products/show", :layout => false
    end

    # auto complete
    def autocomplete
        if params[:term]
            @products = Product.search(params[:term]);
        else
            puts "1"
            @products = Product.all
        end

        @result = Array.new
        @products.each do |item|
            puts item.name
            hash = { "value" => item.name}
            @result << hash
        end

        respond_to do |format|  
            format.html # index.html.erb  
            format.json { render :json => @result.to_json }
        end
    end
end

