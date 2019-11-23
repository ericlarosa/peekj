require 'peekj'
require 'thor'
require 'http'

module Peekj
  class CLI < Thor
    desc 'summary ITEM', 'test'
    def summary(item)
      say(item.to_s)
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