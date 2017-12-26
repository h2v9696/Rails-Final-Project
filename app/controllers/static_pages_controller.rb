class StaticPagesController < ApplicationController
  def home
    @home_products = Product.limit 12
  end

  def index
  end

  def help
  end
end
