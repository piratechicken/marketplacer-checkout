# frozen_string_literal: true

RSpec.describe MarketplacerCheckout::Product do
  subject { described_class.new(123, 'Continental GP5000', 99.0) }

  describe '.load_all' do
    let(:file_path) { "#{File.dirname(__FILE__)}/fixtures/products.json" }

    it 'instantiates Products from a json file' do
      products = described_class.load_all(file_path)

      expect(products.length).to eq(4)
    end

    context 'with invalid product data' do
      let(:file_path) { "#{File.dirname(__FILE__)}/fixtures/products_invalid.json" }

      it 'raises an InvalidProductDataError error' do
        expect { described_class.load_all(file_path) }.to raise_error do |e|
          expect(e).to be_a(MarketplacerCheckout::Product::InvalidProductDataError)
          expect(e.message).to eq(
            'Invalid data: '\
            '{"uuid"=>23881, "name"=>"Chain Ring 146mm", "price"=>"One hundred dollars"}'
          )
        end
      end
    end
  end

  describe '#pretty_string' do
    it 'returns human readable product information' do
      expect(subject.pretty_string).to eq('ID: 123 | Title: Continental GP5000 | Price: $99.0')
    end
  end
end
