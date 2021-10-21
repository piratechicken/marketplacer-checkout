# frozen_string_literal: true

module MarketplacerCheckout
  class CLI
    def initialize(products_file_path)
      @products = MarketplacerCheckout::Product.load_all(products_file_path)
      @cart = MarketplacerCheckout::Cart.new
    end

    def run
      print_instructions
      print_available_products
      print_cart
    end

    private

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
