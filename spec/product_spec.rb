# frozen_string_literal: true

RSpec.describe MarketplacerCheckout::Product do
  describe '.load_all' do
    let(:file_path) { "#{File.dirname(__FILE__)}/fixtures/products.json" }

    it 'instantiates Products from a json file' do
      products = described_class.load_all(file_path)

      expect(products.length).to eq(4)
    end
  end
end
