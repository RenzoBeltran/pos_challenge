require './data/data_list'

class Terminal 
  attr_accessor :products_scanned
  include Variables
  
  def initialized
    @products_scanned = []
  end

  def scan(product)
    @products_scanned << Variables::PRODUCTS_LIST[product.to_sym]
  end

  def total_price
    total_price = self.sale_details.map {|key, value| value }.reduce(:+)
    total_price
  end

  def sale_details
    counter_details = self.counter_details
    products_with_prices = counter_details.map do |key, value|
      if key == "A"
        [key, value = (value/4) * 7 + (value % 4) * Variables::PRODUCTS_LIST[:A].price]  
      elsif key == "C"
        [key, value = (value/6) * 6 + (value % 6) * Variables::PRODUCTS_LIST[:C].price] 
      else
        [key, value = value * Variables::PRODUCTS_LIST[key.to_sym].price]
      end
    end
    products_with_prices.to_h      
  end

  def counter_details
    @counter_details = {}
    @products_scanned.each do |product|
      @counter_details[product.code] = 0 unless @counter_details[product.code]
      @counter_details[product.code] += 1
    end
    @counter_details
  end
end