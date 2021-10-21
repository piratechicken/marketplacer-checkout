# frozen_string_literal: true

module MarketplacerCheckout
  class Cart
    attr_reader :line_items

    def initialize
      @line_items = {}
    end

    def add_line_item(product)
      matching_line_item = @line_items[product.uuid]

      add_new_line_item(product) && return if matching_line_item.nil?

      increment_line_item_quantity
    end

    def remove_line_item(product_uuid)
      # Remove product or decrement quantity
    end

    def total_cost
      # line_items total - discounts
    end

    private

    def add_new_line_item(product)
      @line_items[product.uuid] = LineItem.new(product.uuid, 1, product.price)
    end

    def increment_line_item_quantity(line_item)
    end

    def apply_discount
      # 
    end
  end
end
