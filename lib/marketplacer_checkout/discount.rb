# frozen_string_literal: true

module MarketplacerCheckout
  class Discount
    attr_reader :cart_subtotal, :percentage

    def initialize(cart_subtotal, percentage)
      @cart_subtotal = cart_subtotal
      @percentage = percentage
    end
  end
end
