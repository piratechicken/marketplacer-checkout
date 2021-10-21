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

    def total_cost
      line_items_total - discounts_total
    end

    def pretty_string
      "#{line_items_as_string}\nTotal: $#{format('%.2f', total_cost)}"
    end

    private

    def add_new_line_item(product)
      line_items[product.uuid] = LineItem.new(product.uuid, product.name, 1, product.price)
    end

    def apply_discount
      # TODO
    end

    def line_items_total
      line_items.values.sum { |line_item| line_item.quantity * line_item.unit_price }
    end

    def discounts_total
      # TODO
      0
    end

    def line_items_as_string
      return "You have no items in your cart\n" if @line_items.empty?

      line_items.values.map.with_index do |line_item, index|
        "#{index + 1}: #{line_item.pretty_string}"
      end.join("\n")
    end
  end
end
