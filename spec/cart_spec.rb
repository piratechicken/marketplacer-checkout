# frozen_string_literal: true

RSpec.describe MarketplacerCheckout::Cart do
  subject { described_class.new }

  let(:product) { MarketplacerCheckout::Product.new(123, 'Chain Ring', 100.99) }

  describe '#add_line_item' do
    it 'adds the matching product as line_item' do
      subject.add_line_item(product)

      line_item = subject.line_items[product.uuid]

      expect(subject.line_items.length).to eq(1)
      expect(line_item).to be_kind_of(MarketplacerCheckout::LineItem)
      expect(line_item).to have_attributes(
        product_uuid: product.uuid,
        quantity: 1,
        unit_price: product.price
      )
    end

    context 'when there is already a line_item' do
      context 'with a matching product uuid' do
        it 'increments the line_item quantity' do
          3.times { subject.add_line_item(product) }

          line_item = subject.line_items[product.uuid]

          expect(subject.line_items.length).to eq(1)
          expect(line_item).to be_kind_of(MarketplacerCheckout::LineItem)
          expect(line_item).to have_attributes(
            product_uuid: product.uuid,
            quantity: 3,
            unit_price: product.price
          )
        end
      end

      context 'with a different product uuid' do
        let(:product_two) { MarketplacerCheckout::Product.new(234, '11-23 cassette', 80.45) }

        before { subject.add_line_item(product) }

        it 'adds a new line item' do
          subject.add_line_item(product_two)

          line_item_two = subject.line_items[product_two.uuid]

          expect(subject.line_items.length).to eq(2)
          expect(line_item_two).to be_kind_of(MarketplacerCheckout::LineItem)
          expect(line_item_two).to have_attributes(
            product_uuid: product_two.uuid,
            quantity: 1,
            unit_price: product_two.price
          )
        end
      end
    end
  end
end
