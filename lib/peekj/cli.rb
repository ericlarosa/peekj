require 'peekj'
require 'thor'

module Peekj
  class CLI < Thor
    desc "summary ITEM", "Prints issue summary"
    def summary(issue_key)
      issue = JiraApi.get_issue(issue_key)

      say(issue.summary)
    end


    desc "login", "Enter login credentials"
    def login
      Credentials::KEYS.each do |credential_key|
        credential_value = ask("#{credential_key}:")

        Credentials.send("#{credential_key}=", credential_value)
      end
    end
  end
end