# frozen_string_literal: true

module MarketplacerCheckout
  class Cart
    attr_reader :line_items

    def initialize
      @line_items = []
    end

    def add_line_item(product_uuid)
      # Add product or increment quantity
    end

    def remove_line_item(product_uuid)
      # Remove product or decrement quantity
    end

    def total_cost
      # line_items total - discounts
    end

    private

    def apply_discount
      # 
    end
  end
end
