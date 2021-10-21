# frozen_string_literal: true

module MarketplacerCheckout
  class CLI
    def initialize(products_file_path, discounts_file_path)
      @products = MarketplacerCheckout::Product.load_all(products_file_path)
      available_discounts = MarketplacerCheckout::Discount.load_all(discounts_file_path)
      @cart = MarketplacerCheckout::Cart.new(available_discounts)
    end

    def run
      loop do
        print_status

        user_input = gets.strip

        case user_input
        when 'x'
          puts "\nThanks for shopping with Marketplacer!\n"
          abort
        else
          find_and_add_product(user_input)
        end
      end
    end

    private

    def find_and_add_product(user_input)
      uuid = user_input.to_i

      matching_product = @products.find { |product| product.uuid == uuid }

      return if matching_product.nil?

      @cart.add_line_item(matching_product)
    end

    def print_status
      puts
      print_instructions
      print_available_products
      print_cart
    end

    def print_instructions
      puts 'Instructions:'
      puts '- Add an item to your cart by entering it\'s ID'
      puts '- Exit by entering x'
      puts
    end

    def print_available_products
      puts 'Available products:'
      @products.each { |product| puts product.pretty_string }
      puts
    end

    def print_cart
      puts 'You current cart:'
      puts @cart.pretty_string
      puts
    end
  end
end
