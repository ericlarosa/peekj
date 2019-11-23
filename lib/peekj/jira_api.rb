require 'peekj'
require 'http'

module Peekj
  class JiraApi
    def self.get_issue(issue_key)
      response = new.get("issue/#{issue_key}")

      OpenStruct.new(
        summary: response['fields']['summary']
      )
    end

    def get(relative_path)
      HTTP.basic_auth(auth_params).get("#{base_url}#{relative_path}").parse
    end

    private

    def auth_params
      @auth_params ||= {user: Credentials.username, pass: Credentials.api_token}
    end

    def base_url
      app_url = Credentials.app_url

      "#{app_url}/rest/api/latest/"
    end
  end
end