# frozen_string_literal: true

module MarketplacerCheckout
  class Product
    attr_accessor :uuid, :name, :price

    def initialize(uuid, name, price)
      @uuid = uuid
      @name = name
      @price = price
    end
  end
end
