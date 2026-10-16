require 'spec_helper'
describe Rails::Application::Configuration do
  describe '#cache_store_names' do
    let(:configuration) { Rails::Application::Configuration.new(Pathname.new('')) }

    it 'returns all configured names' do
      configuration.cache_store = { name: :secondary, setting: :memory_store }
      configuration.cache_store = { name: :tertiary, setting: :null_store }
      expect(configuration.cache_store_names).to eq %i[default secondary tertiary]
    end

    it 'falls back to the default store for an unknown name' do
      expect(configuration.cache_store(:unknown)).to eq configuration.cache_store
    end
  end
end
