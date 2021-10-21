# frozen_string_literal: true

RSpec.describe MarketplacerCheckout::Cart do
  subject { described_class.new }

  let(:product) { MarketplacerCheckout::Product.new(uuid, 'Chain Ring', 100.99) }
  let(:uuid) { 123 }

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

    # context 'when there is already an matching product in the line_items' do
    #   it 'increments the line_item quantity' do
    #     2.times { subject.add_line_item(product) }

    #     line_item = subject.line_items.first

    #     expect(subject.line_items.count).to eq(1)
    #     expect(line_item).to be_kind_of(MarketplacerCheckout::LineItem)
    #     expect(line_item).to have_attributes(
    #       product_uuid: product.uuid,
    #       quantity: 2,
    #       unit_price: product.price
    #     )
    #   end
    # end
  end
end
