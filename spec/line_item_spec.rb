# frozen_string_literal: true

RSpec.describe MarketplacerCheckout::LineItem do
  subject { described_class.new(product_uuid, name, quantity, unit_price) }

  let(:product_uuid) { 123 }
  let(:name) { 'Look keo' }
  let(:quantity) { 2 }
  let(:unit_price) { 10.99 }

  describe '#increment_quantity' do
    it 'increments the quantity three times' do
      3.times { subject.increment_quantity }

      expect(subject.quantity).to eq(5)
    end
  end

  describe '#pretty_string' do
    it 'returns human readable line_item information' do
      expect(subject.pretty_string).to eq(
        'Look keo | Quantity: 2 | Unit price: $10.99 | Price: $21.98'
      )
    end
  end

  describe '#price' do
    it 'returns the price total price for the item (quantity * unit_price)' do
      expect(subject.price).to eq(21.98)
    end
  end
end
