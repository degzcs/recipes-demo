require 'contentful'
require 'byebug'

class Recipe

  attr_reader :title, :photo, :description, :tags, :chef

  #
  # Instance Methods
  #

  def initialize(client_entry)
    @title = client_entry.title
    @photo = client_entry.photo
    @description = client_entry.description
    @tags = client_entry.tags
    @chef = client_entry.chef
  rescue Contentful::EmptyFieldError
    nil
  end

  def image_url
    "https:#{photo.image_url}" unless photo.nil?
  end

  def chef_name
    chef&.name
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

