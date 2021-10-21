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

      matching_line_item.increment_quantity
    end

    def remove_line_item(product_uuid)
      # Remove product or decrement quantity
    end

    def total_cost
      line_items_total - discounts_total
    end

    private

    def add_new_line_item(product)
      @line_items[product.uuid] = LineItem.new(product.uuid, 1, product.price)
    end

    def apply_discount
      # 
    end

    def line_items_total
    end

    def discounts_total
      # TODO
      0
    end
  end
end
