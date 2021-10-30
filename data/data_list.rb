require './classes/Product.rb'

module Variables
  productA = Product.new("A", 2.00)
  productB = Product.new("B", 12.00)
  productC = Product.new("C", 1.25)
  productD = Product.new("D", 0.15)
  
  PRODUCTS_LIST = { 
    A: productA,
    B: productB, 
    C: productC, 
    D: productD
  }
end