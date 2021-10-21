# frozen_string_literal: true

RSpec.describe MarketplacerCheckout::Discount do
  subject { described_class.new(300, 10) }

  describe '.load_all' do
    let(:file_path) { "#{File.dirname(__FILE__)}/fixtures/discounts.json" }

    it 'instantiates Discounts from a json file' do
      discounts = described_class.load_all(file_path)

      expect(discounts.length).to eq(3)
    end
  end

  describe '#pretty_string' do
    it 'returns human readable discount information' do
      expect(subject.pretty_string).to eq('10% off on total greater than $300')
    end
  end
end
