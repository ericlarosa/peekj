require 'peekj'
require 'http'

module Peekj
  class JiraApi
    def self.search(jql)
      response = new.get("search#{jql}")
    end

    def self.get_issue(issue_key)
      response = new.get("issue/#{issue_key}")

      OpenStruct.new(
        status: response['fields']['status']['name'],
        summary: response['fields']['summary'],
        description: response['fields']['description'],
        comments: response['fields']['comment']['comments'].map { |c|
          {author: c['author']['displayName'], body: c['body']}
        }
      )
    end

    def self.add_comment(issue_key, comment_body)
      params =  {body: comment_body}
      response = new.post("issue/#{issue_key}/comment", params)
      post_succeeded = !response['created'].nil?
      post_succeeded
    end

    def get(relative_path)
      HTTP.basic_auth(auth_params).get("#{base_url}#{relative_path}").parse
    end

    def post(relative_path, params)
      HTTP.basic_auth(auth_params).post("#{base_url}#{relative_path}", json: params).parse
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
