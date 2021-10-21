# frozen_string_literal: true

RSpec.describe MarketplacerCheckout::LineItem do
  subject { described_class.new(product_uuid, quantity, unit_price) }

  let(:product_uuid) { 123 }
  let(:quantity) { 2 }
  let(:unit_price) { 10.99 }

  describe '#increment_quantity' do
    it 'increments the quantity three times' do
      3.times { subject.increment_quantity }

      expect(subject.quantity).to eq(5)
    end
  end
end
