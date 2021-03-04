require 'contentful'
require 'byebug'

class Recipe
  def all
  end

  def by_id(id)
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
