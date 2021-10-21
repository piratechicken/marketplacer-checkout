# frozen_string_literal: true

require 'JSON'

module MarketplacerCheckout
  class Product
    class InvalidProductDataError < StandardError; end

    private_class_method :valid_data?, :validate_data

    attr_accessor :uuid, :name, :price

    def initialize(uuid, name, price)
      @uuid = uuid
      @name = name
      @price = price
    end

    def self.load_all(file_path)
      products_data = JSON.parse(File.read(file_path))

      products_data.map do |product_data|
        validate_data(product_data)

        new(product_data['uuid'], product_data['name'], product_data['price'])
      end
    end

    def self.validate_data(product_data)
      return if valid_data?(product_data)

      raise InvalidProductDataError, "Invalid data: #{product_data}"
    end

    def self.valid_data?(product_data)
      product_data['uuid'].is_a?(Integer) &&
        product_data['name'].is_a?(String) &&
        product_data['price'].is_a?(Float)
    end
  end
end
