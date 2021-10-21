# frozen_string_literal: true

RSpec.describe MarketplacerCheckout::Cart do
  subject { described_class.new(available_discounts) }

  let(:available_discounts) { nil }
  let(:product) { MarketplacerCheckout::Product.new(123, 'Chain Ring', 100.99) }
  let(:product_two) { MarketplacerCheckout::Product.new(234, '11-23 cassette', 80.45) }

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

    context 'with available discounts' do
      let(:available_discounts) do
        [
          MarketplacerCheckout::Discount.new(300, 10),
          MarketplacerCheckout::Discount.new(350, 20)
        ]
      end

      before do
        subject.add_line_item(product)
        subject.add_line_item(product_two)
      end

      it 'does not apply a discount' do
        expected_cost = product.price + product_two.price

        expect(subject.total_cost).to eq(expected_cost)
      end

      context 'when it qualifies for a discount' do
        before do
          subject.add_line_item(product)
          subject.add_line_item(product_two)
        end

        it '' do
          line_item_total = (2 * product.price) + (2 * product_two.price)
          discount = line_item_total * 20 / 100
          expected_cost = line_item_total - discount

          expect(subject.total_cost).to eq(expected_cost)
        end
      end
    end
  end

  describe '#total_cost' do
    before do
      3.times { subject.add_line_item(product) }
      2.times { subject.add_line_item(product_two) }
    end

    it 'sums the line item costs' do
      expected_cost = (3 * product.price) + (2 * product_two.price)

      expect(subject.total_cost).to eq(expected_cost)
    end
  end

  describe '#pretty_string' do
    before do
      3.times { subject.add_line_item(product) }
      2.times { subject.add_line_item(product_two) }
    end

    it 'returns a human readable cart summary' do
      expect(subject.pretty_string).to eq(expected_pretty_string)
    end
  end

  describe 'discounts' do
    let(:available_discounts) do
      [
        MarketplacerCheckout::Discount.new(300, 10),
        MarketplacerCheckout::Discount.new(400, 20)
      ]
    end

    before do
      3.times { subject.add_line_item(product) }
      2.times { subject.add_line_item(product_two) }
    end

    it '' do
      expect(subject.total_cost).to eq(100.50)
    end
  end

  private

  def expected_pretty_string
    "1: Chain Ring | Quantity: 3 | Unit price: $100.99 | Price: $302.97\n"\
      "2: 11-23 cassette | Quantity: 2 | Unit price: $80.45 | Price: $160.90\n"\
      'Total: $463.87'
  end
end
