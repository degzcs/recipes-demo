require 'spec_helper'

RSpec.describe Recipe do
  context '#all' do
    it 'should retrieve all recipes from Contenful web service' do
    end
  end

  context '#by_id' do
    it 'should bring an specific record from Contentful web service' do
    end

    it 'raises an error when the record is not found' do
    end
  end

  context '#client' do
    it 'should create instance for the Contentful client' do
      VCR.use_cassette('success_client_config') do
        expect(subject.client).to be_a Contentful::Client
      end
    end

    context 'when there is a wrong configuration' do
      before :each do
        ENV['CONTENTFUL_SPACE_ID'] = nil
      end

      it 'raises an error saying about the argument error' do
        expect { subject.client }.to raise_error(ArgumentError)
      end
    end
  end
end
