require 'spec_helper'

RSpec.describe Recipe do
  context 'scopes' do
    context '#all' do
      it 'should retrieve all recipes from Contenful web service' do
        VCR.use_cassette('success_get_all_entries') do
          recipes = Recipe.all
          expect(recipes).to be_a Array
          recipes.each do |recipe|
            expect(recipe).to be_a Recipe
          end
        end
      end
    end

    context '#by_id' do
      it 'should bring an specific record from Contentful web service' do
        VCR.use_cassette('success_get_entry') do
          expect(Recipe.by_id('4dT8tcb6ukGSIg2YyuGEOm')).to be_a Recipe
        end
      end

      it 'raises an error when the record is not found' do
        VCR.use_cassette('fails_get_entry') do
          expect{Recipe.by_id('invalid_id')}.to raise_error Recipe::RecipeNotFoundError
        end
      end
    end
  end

  context '#client' do
    it 'should create instance for the Contentful client' do
      VCR.use_cassette('success_client_config') do
        expect(Recipe.client).to be_a Contentful::Client
      end
    end

    context 'when there is a wrong configuration' do
      before :each do
        Recipe.client = nil
        ENV['CONTENTFUL_SPACE_ID'] = nil
      end

      it 'raises an error saying about the argument error' do
        expect { Recipe.client }.to raise_error(ArgumentError)
      end
    end
  end
end
