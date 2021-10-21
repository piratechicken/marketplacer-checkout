# frozen_string_literal: true

module MarketplacerCheckout
  class Discount
    attr_reader :cart_subtotal, :percentage

    def initialize(cart_subtotal, percentage)
      @cart_subtotal = cart_subtotal
      @percentage = percentage
    end

    def self.load_all(file_path)
      discounts_data = JSON.parse(File.read(file_path))

      discounts_data.map do |discount_data|
        new(discount_data['cart_subtotal'].to_f, discount_data['percentage'].to_f)
      end
    end

    def pretty_string
      "#{percentage}% off on total greater than $#{cart_subtotal}"
    end
  end
end
