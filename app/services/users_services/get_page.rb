# frozen_string_literal: true

require 'httparty'
# service class for request api
module UsersServices
  # class for find user by page
  class GetPage
    include HTTParty
    base_uri 'https://reqres.in/api/users'
    format :json
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def call
      pages = page(@id)
      if pages.any?
        pages
      else
        { pages: 'There is no page' }
      end
    end

    private

    def page(id = 1)
      self.class.get("#{self.class.base_uri}?page=#{id}").parsed_response
    end
  end
end
