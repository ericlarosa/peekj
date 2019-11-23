require 'peekj'
require 'thor'
require 'http'

module Peekj
  class CLI < Thor
    desc 'summary ITEM', 'test'
    def summary(item)
      say(item.to_s)
    end
  end
end