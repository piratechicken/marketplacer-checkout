# frozen_string_literal: true

module MarketplacerCheckout
  class LineItem
    attr_reader :product_uuid, :name, :quantity, :unit_price

    def initialize(product_uuid, name, quantity, unit_price)
      @product_uuid = product_uuid
      @name = name
      @quantity = quantity
      @unit_price = unit_price
    end

    def increment_quantity
      @quantity += 1
    end

    def pretty_string
      "#{name} | Quantity: #{quantity} | Unit price: $#{unit_price} | Price: $#{format('%.2f', price)}"
    end

    def price
      quantity * unit_price
    end
  end
end
