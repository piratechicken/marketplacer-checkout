# frozen_string_literal: true

require_relative './marketplacer_checkout/cart'
require_relative './marketplacer_checkout/cli'
require_relative './marketplacer_checkout/line_item'
require_relative './marketplacer_checkout/product'
require_relative './marketplacer_checkout/discount'

module MarketplacerCheckout
  DISCOUNTS_FILE_PATH = 'assets/discounts.json'
  PRODUCTS_FILE_PATH = 'assets/products.json'

  def self.run
    products_file_path = "#{File.dirname(__FILE__)}/#{PRODUCTS_FILE_PATH}"
    discounts_file_path = "#{File.dirname(__FILE__)}/#{DISCOUNTS_FILE_PATH}"

    MarketplacerCheckout::CLI.new(products_file_path, discounts_file_path).run
  end
end
