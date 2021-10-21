# frozen_string_literal: true

module MarketplacerCheckout
  class Cart
    attr_reader :line_items

    def initialize(available_discounts)
      @line_items = {}
      @available_discounts = available_discounts
      @applied_discount = nil
    end

    def add_line_item(product)
      matching_line_item = @line_items[product.uuid]

      if matching_line_item.nil?
        add_new_line_item(product)
      else
        matching_line_item.increment_quantity
      end

      update_discount
    end

    def total_cost
      line_items_total - discount_total
    end

    def pretty_string
      "#{line_items_as_string}\n#{discount_as_string}\n#{total_as_string}"
    end

    private

    def add_new_line_item(product)
      line_items[product.uuid] = LineItem.new(product.uuid, product.name, 1, product.price)
    end

    def line_items_total
      line_items.values.sum { |line_item| line_item.quantity * line_item.unit_price }
    end

    def discount_total
      return 0 if @applied_discount.nil?

      line_items_total * @applied_discount.percentage / 100
    end

    def update_discount
      qualifying_discounts = @available_discounts&.select do |discount|
        discount.cart_subtotal < line_items_total
      end

      @applied_discount = qualifying_discounts&.max_by(&:cart_subtotal)
    end

    def line_items_as_string
      return "You have no items in your cart\n" if @line_items.empty?

      line_items.values.map.with_index do |line_item, index|
        "#{index + 1}: #{line_item.pretty_string}"
      end.join("\n")
    end

    def discount_as_string
      return 'You have no discounts applied' if @applied_discount.nil?

      "Discount applied: #{@applied_discount.pretty_string}"
    end

    def total_as_string
      "Total: $#{format('%.2f', total_cost)}"
    end
  end
end
