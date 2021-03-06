require 'spec_helper'

RSpec.describe 'List View', type: :request do
  let(:app) { Api.new }
  let(:response) { get '/' }
  it 'should be 200 OK' do
    VCR.use_cassette('success_get_all_entries') do
      expect(response.status).to eq 200
    end
  end

  it 'should retrieve the 4 available recipes' do
    VCR.use_cassette('success_get_all_entries') do
      expect(response.body).to have_tag(:a, :href => "recipes/4dT8tcb6ukGSIg2YyuGEOm")
      expect(response.body).to have_tag(:a, :href => "recipes/5jy9hcMeEgQ4maKGqIOYW6")
      expect(response.body).to have_tag(:a, :href => "recipes/2E8bc3VcJmA8OgmQsageas")
      expect(response.body).to have_tag(:a, :href => "recipes/437eO3ORCME46i02SeCW46")
    end
  end
end
