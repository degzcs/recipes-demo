require 'spec_helper'

RSpec.describe 'Details View', type: :request do
  let(:app) { Api.new }
  let(:response) { get '/recipes/4dT8tcb6ukGSIg2YyuGEOm' }
  it 'should be 200 OK' do
    VCR.use_cassette('success_get_entry') do
      expect(response.status).to eq 200
    end
  end

  it 'should get the basic elements for the recipe' do
    VCR.use_cassette('success_get_entry') do
      expect(response.body).to have_tag('img.card-img-top')
      expect(response.body).to have_tag('h5.card-title')
      expect(response.body).to have_tag('div#comment-md-preview-container')
      expect(response.body).to have_tag('p.tags')
    end
  end
end
