require 'contentful'
require 'byebug'

class Recipe
  RecipeNotFoundError = Class.new(StandardError)

  attr_reader :title, :photo, :description, :tags, :chef, :id

  #
  # Instance Methods
  #

  def initialize(client_entry)
    @id = client_entry.id
    @title = client_entry.title
    @photo = client_entry.photo
    @description = client_entry.description
    @tags = client_entry&.tags&.map(&:name)
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
      client.entries.map do |entry| #(content_type: 'recipe').map do |entry|
        self.new(entry)
      end
    end

    def by_id(id)
      client_entry = client.entry(id)
      raise RecipeNotFoundError, 'The recipe could not be found' if client_entry.nil?
      self.new(client_entry)
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

