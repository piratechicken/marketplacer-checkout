# frozen_string_literal: true

require_relative './marketplacer_checkout/cart'
require_relative './marketplacer_checkout/cli'
require_relative './marketplacer_checkout/line_item'
require_relative './marketplacer_checkout/product'
# require_relative './marketplacer_checkout/discount'

module MarketplacerCheckout
  PRODUCT_FILE_PATH = 'assets/products.json'

  def self.run
    product_file_path = "#{File.dirname(__FILE__)}/#{PRODUCT_FILE_PATH}"

    MarketplacerCheckout::CLI.new(product_file_path).run
  end
end
