# frozen_string_literal: true

module MarketplacerCheckout
  class LineItem
    attr_reader :product_uuid, :quantity, :unit_price

    def initialize(product_uuid, quantity, unit_price)
      @product_uuid = product_uuid
      @quantity = quantity
      @unit_price = unit_price
    end

    def increment_quantity
      @quantity += 1
    end
  end
end
