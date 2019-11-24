require 'peekj'
require 'thor'

module Peekj
  class CLI < Thor
    desc "login", "Enter login credentials"
    def login
      Credentials::KEYS.each do |credential_key|
        credential_value = ask("#{credential_key}:")

        Credentials.send("#{credential_key}=", credential_value)
      end
    end

    desc "summary ITEM", "Prints issue summary"
    method_options current_branch: :boolean,
                   short: :boolean,
                   long: :boolean
    def summary(issue_key=nil)
      issue_key = current_branch_issue_key if options['current_branch']

      issue = JiraApi.get_issue(issue_key)

      say("#{issue_key} ", [:bold, :red])
      say("(#{issue.status})", [:bold, :magenta])
      say(issue.summary)

      unless options['short']
        say('Description:', [:bold, :red])
        say(issue.description)
      end

      if options['long']
        say('Comments:', [:bold, :red])
        issue.comments.each do |comment|
          say("#{comment[:author]}: ", [:yellow])
          say(comment[:body])
        end
      end
    end

    private

    def current_branch_issue_key
      current_branch = `git rev-parse --abbrev-ref HEAD`
      current_branch.match(/[^-]*-[^-]*/)
    end
  end
end
