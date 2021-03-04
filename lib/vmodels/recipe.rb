require 'contentful'
require 'byebug'

class Recipe

  #
  # Instance Methods
  #

  def initialize(client_entry)
    @title = client_entry.title
    @image_url = client_entry.photo
  end

  #
  # Class Methods
  #

  class << self
    attr_accessor :client

    def all
      client.entries(content_type: 'recipe').map do |entry|
        self.new(entry)
      end
    end

    def by_id(id)
      self.new(client.entry(id))
    end

    def client
      @client ||= Contentful::Client.new(
        access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
        space: ENV['CONTENTFUL_SPACE_ID'],
        dynamic_entries: :auto,
        raise_errors: true
      )
    end
  end
end

