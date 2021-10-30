require './classes/Product'
require './classes/Terminal'
require './data/data_list'

def main
  include Variables
  is_active = true
  terminal = Terminal.new
  while is_active do
    puts "Introduce un código de producto: "
    product_code = gets.chomp

    if Variables::PRODUCTS_LIST.include?(product_code.upcase.to_sym)
      terminal.scan(product_code.upcase)
    else
      puts "Introduzca un producto que exista en el almacén."
      next
    end
    
    option = nil
    while option != "1" do 
      puts "OPCIONES:\n
      1) Escanear otro producto\n
      2) Calcular precio total"
      option = gets.chomp
      if option == "1"
        next
      elsif option == "2"
        puts "Detalle de compra:"

        terminal.sale_details.each do |key, value|
          puts "#{terminal.counter_details[key]} unidad(es) de Producto #{key}: $#{value}"
        end

        puts "================================================================"
        puts "El precio total es: $ #{terminal.total_price}\n\n"
        new_operation_status = true
        
        while new_operation_status do
          puts "¿Quiere realizar otra operacion?"
          puts "S/n"
          new_operation = gets.chomp
          if new_operation.downcase == "s"
            main()
          elsif new_operation.downcase == "n"
            is_active = false
            new_operation_status = false
          else 
            puts "escriba entre 's' o 'n'"
          end 
        end
        break
      else 
        puts "Debes escoger entre opción 1 o 2"
      end 
    end
  end
end

main