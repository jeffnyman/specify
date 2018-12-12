# Specify

> **The height of sophistication is simplicity.**<br>
> &nbsp;&nbsp;&nbsp;&nbsp;*Clare Boothe Brokaw*

---

Specify is a tool for leveraging RSpec to create an expressive DSL for test and data conditions. Specify will also provide test result reporting that recognizes the DSL.

Specify provides an internal DSL, similar to the [RSpec Story Runner](https://github.com/dchelimsky/rspec-stories). This was the predecessor of the [Cucumber](http://cukes.info/) external DSL provided by [Gherkin](http://cukes.info/gherkin.html).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'specify'
```

To get the latest code:

```ruby
gem 'specify', git: 'https://github.com/jeffnyman/specify'
```

After doing one of the above, execute the following command:

```
$ bundle
```

You can also install Specify just as you would any other gem:

```
$ gem install specify
```

## Usage

To use Specify you simply have to require it within your `spec_helper.rb` file:

```ruby
require 'specify'
```

Because Specify uses a custom formatter, you should have an `.rspec` file with the following line in it:

```ruby
--format RSpec::Specify::Formatter
```

Then you simply run your `rspec` command as normal against your test suite. Where the Specify formatter comes into play is in how you can construct your test specifications. You can use RSpec constructs within Specify constructs. Here is an example:

```ruby
Feature 'Bank Accounts' do
  let(:valid_account_number) { '1234567890' }
  subject { Account.new(valid_account_number) }

  Scenario 'starting a new account' do
    test 'will have a starting balance of 0' do
      expect(subject.balance).to eq(0)
    end

    it 'will not allow an invalid account name' do
      expect { Account.new('thx1138') }.to raise_error(InvalidAccountNumberError)
    end
  end
end
```

You can see that within the Specify-provided `Feature` construct I have the standard `let` and `subject` elements. Within the Specify-provided `Scenario` you can see I use a Specify-provide method (`test`) and an RSpec-provided method (`it`).

Modern development practices put an emphasis on communication. Much of this communication is done via the mechanisms of tests. These tests ideally act as readable specifications that communicate the intent of a test. Equally ideally, however, these tests do not hide the code that executes them behind too many layers of abstractions.

Tools in the xSpec family, of which RSpec is a part, do a good job of keeping code as a first-class citizen. This is contrasted with tools in the xBehave family, of which Cucumber is a part, where you have various abstractions like feature files sitting in front of code. Beyond that you also often have an intermediary layer, like the step definition files of Cucumber, that add one more layer of maintenance.

Beyond even that, such xBehave tools often do limit you to the expressions available via a structuring syntax, such as with the Gherkin API, that is outside of the code.

Specify lets you write as much logic beside your specifications as you want by leveraging the RSpec ecosystem with the addition of a Gherkin-like syntax as well as additions to that syntax. Perhaps worth noting is that Specify has no dependence on Gherkin.

The [unit tests](https://github.com/jeffnyman/specify/tree/master/spec) will give you some idea of how Specify allows the structuring of test specifications.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake spec:all` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To experiment with the code, run `bin/console` for an interactive prompt. If you want to make changes and see how they work as a gem installed on your local machine, run `bundle exec rake install`.

The default `rake` command will run all tests as well as a Rubocop analysis.

If you have rights to deploy a new version, make sure to update the version number in `version.rb`, and then run `bundle exec rake release`. This will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/jeffnyman/specify](https://github.com/jeffnyman/specify). The testing ecosystem of Ruby is very large and this project is intended to be a welcoming arena for collaboration on yet another test-supporting tool. As such, contributors are very much welcome but are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) which is provided as a [code of conduct](https://github.com/jeffnyman/specify/blob/master/CODE_OF_CONDUCT.md).

The Specify gems follows [semantic versioning](http://semver.org).

To contribute to Specify:

1. [Fork the project](http://gun.io/blog/how-to-github-fork-branch-and-pull-request/).
2. Create your feature branch. (`git checkout -b my-new-feature`)
3. Commit your changes. (`git commit -am 'new feature'`)
4. Push the branch. (`git push origin my-new-feature`)
5. Create a new [pull request](https://help.github.com/articles/using-pull-requests).

## Author

* [Jeff Nyman](http://testerstories.com)

## License

Specify is distributed under the [MIT](http://www.opensource.org/licenses/MIT) license.
See the [LICENSE](https://github.com/jeffnyman/specify/blob/master/LICENSE.md) file for details.

## Credits

Specify has been inspired by the following projects. Each provided me with ideas for what to do and, in some cases, for what not to do. All were invaluable as I better considered how to leverage RSpec's functionality.

* [maniok_bdd](https://github.com/21croissants/maniok_bdd)
* [rspec-gherkin](https://github.com/sheerun/rspec-gherkin)
* [rspec example steps](https://github.com/railsware/rspec-example_steps)
* [XSpec](https://github.com/xaviershay/xspec)
* [Mouse Melon](https://github.com/wojtha/mouse_melon)
