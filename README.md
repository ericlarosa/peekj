# Peekj

Command line interface to interact with Jira's API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'peekj'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install peekj

## Usage

Enter Jira credentials and app url:

    $ peekj login

Fetch issue summary:

    $ peekj summary ISSUE-KEY

Fetch issue summary from current branch name:

    $ peekj summary --current_branch

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ericlarosa/peekj. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Peekj project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/peekj/blob/master/CODE_OF_CONDUCT.md).
