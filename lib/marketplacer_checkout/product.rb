# frozen_string_literal: true

require 'JSON'

module MarketplacerCheckout
  class Product
    class InvalidProductDataError < StandardError; end
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

        new(product_data['uuid'], product_data['name'], product_data['price'].to_f)
      end
    end

    def pretty_string
      "ID: #{uuid} | Title: #{name} | Price: $#{price}"
    end

    class << self
      private

      def numerical?(string)
        # This method comes from Rail's numericality source:
        # https://apidock.com/rails/ActiveModel/Validations/ClassMethods/validates_numericality_of
        # And this blog post:
        # https://mentalized.net/journal/2011/04/14/ruby-how-to-check-if-a-string-is-numeric/
        !Float(string).nil?
      rescue ArgumentError, TypeError
        false
      end

      def validate_data(product_data)
        return if valid_data?(product_data)

        raise InvalidProductDataError, "Invalid data: #{product_data}"
      end

      def valid_data?(product_data)
        product_data['uuid'].is_a?(Integer) &&
          product_data['name'].is_a?(String) &&
          numerical?(product_data['price'])
      end
    end
  end
end
