# frozen_string_literal: true

require 'httparty'
# service class for request api
module UsersServices
  # class for find user by email
  class FindBy
    include HTTParty
    base_uri 'https://reqres.in/api/users'
    format :json
    attr_reader :email

    def initialize(email)
      @email = email
    end

    def call
      users = find_user_by_email
      if users.any?
        users
      else
        { message: 'No user found with this email' }
      end
    end

    private

    def fetch_users
      @response = self.class.get(self.class.base_uri.to_s).parsed_response
    end

    def page(id = 1)
      @response = self.class.get("#{self.class.base_uri}?page=#{id}").parsed_response
    end

    def find_user_by_email
      all_user = []
      page_count = fetch_users['total_pages']
      (0..page_count).each do |i|
        @get_info = page(i)
        @get_info['data'].each do |user|
          all_user << user if user['email'].include? @email
        end
      end
      all_user.uniq
    end

    def total_pages
      @response['total_pages']
    end
  end
end
