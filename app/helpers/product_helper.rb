module ProductHelper
def getdetails product_id
  @product_details = Product.find_by id: params[product_id]
end
end