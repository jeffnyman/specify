# Specify

> **The height of sophistication is simplicity.**<br>
> &nbsp;&nbsp;&nbsp;&nbsp;*Clare Boothe Brokaw*

[![Gem Version](https://badge.fury.io/rb/specify.svg)](http://badge.fury.io/rb/specify)
[![Build Status](https://travis-ci.org/jeffnyman/specify.svg)](https://travis-ci.org/jeffnyman/specify)
[![License](http://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/jeffnyman/specify/blob/master/LICENSE.md)
[![Maintainability](https://api.codeclimate.com/v1/badges/a42684de1702ed5a9333/maintainability)](https://codeclimate.com/github/jeffnyman/specify/maintainability)

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

### The Specify API

In RSpec, `describe` creates an example group and `it` creates a single example. You can use `context` as an alias for `describe` and you can use `example` and `specify` as aliases for `it`. Specify does a couple of things in the context of the API that RSpec provides.

Specify adds a few new example groups: `Feature` and `Story`. These are considered top-level example groups. Because they are top-level, they are mutually exlcusive so you can't have one nested within the other.

Specify also provides another set of example groups: `Ability`, `Component`, `Workflow`, and `Service`. These can be nested within one another and can be nested within the top-level example groups.

Specify provides some constructs that map to RSpec hooks as well: `Background` and `Setup` (both of which act like an RSpec `before`) along with `Teardown` and `Cleanup` (both of which act like an RSpec `after`).

As a very simple example, consider this:

```ruby
Feature 'The Nature of Truth' do
  Ability 'logic tests can be applied' do
    Scenario 'true is not false' do
      Then 'true is almost certainly not false' do
        expect(true).to_not be false
      end
    end

    Scenario 'true is true' do
      Then 'true is pretty definitely true' do
        expect(true).to be true
      end
    end
  end
end
```

Gherkin structures allow you to use the word "Ability" as an alias for "Feature". However Specify takes the viewpoint that a feature could be speaking to a high-level viewpoint, within which there are multiple abilities. Thus you can use both descriptors simultaneously, one nested within the other, which would not be possible with Gherkin. You can also see here that multiple Scenario blocks can be included within a Feature or Ability just as they would in Gherkin.

You might know that RSpec allows you to define your own names for its constructs already. For example, I could do something like this:

```ruby
RSpec.configure do |rspec|
  rspec.alias_example_group_to :scenario
  rspec.alias_example_to :then
end
```

So why wouldn't you just do that instead of using something like Specify? The answer lies in realizing that the `Scenario` implementation provided by Specify is not just acting as an alias for `context`. Rather, Specify hooks into RSpec to change the execution. This is done by extending RSpec to support step groups.

### Specify Augments RSpec

RSpec is predicated upon unit testing or, at most, integration testing. Thus RSpec focuses on providing a runner that works for edge-to-edge tests. As such, RSpec's mode of action is that all examples should be completely independent. Consider this:

```ruby
context 'Simple Scenario' do
  it 'sets up some context' do
  end

  it 'takes some action'
  end

  it 'observes some result' do
  end
end
```

Here each it block is a step but also is one independent test. The conditions for passing or failing must be within each step. Contrast this with a Cucumber feature scenario:

```
Scenario: 'Simple Scenario'
  Given some context
  When  some action
  Then  some result
```

Here the `Scenario` block has three steps but they are not independent. They have to work together to be considered a passing or failing test.

So, for end-to-end purposes, this means if you want to use RSpec you have to write a sequence of examples, each of which repeats the behavior of all previous examples. Another alternative is that you could write one single large example that performs the entire set of actions. The problem in that case is that there is no independent reporting of each step. Or you could try to rely on a clever use of `before` and `after` calls. The problem there is that the `before` and `after` logic may differ significantly between tests. This is why tools like Cucumber end up being used.

So that's one of the goals of Specify: provide just the good parts of Cucumber and skip all the questionable parts.

At minimum this means the ability to chain examples into a series of steps that run in sequence and which stop when a step fails. This allows you to assemble a series of tests that should all pass, but where complete isolation of those tests is not sensible. Given how Specify augments RSpec, this allows RSpec to be less unit and more integration and certainly more end-to-end.

Key to this is the ability to share state between example steps.

To that end, within the idea of an example group, Specify provides some constructs that are marked with metadata of "has_steps": `Scenario`, `Behavior`, and `Condition`. You can use non-capitalized variations of these as well. These are considered step groups. These cannot be nested within one another.

You can also use the following: `Steps`, `Rules`, `Tests`, `Facts` (along with non-capitalized variants). These are just meant to accommodate various ways of expressing tests but they also show you how Specify can be used to provide a grammar that is as expressive as you would like it to be.

Specify allows the normal RSpec `it`, `example`, and `specify` example keywords to be used within these step groups. However, Specify also adds a few other example keywords based on the above constructs: `step`, `rule`, `test`, and `fact`. Specify also provides the Gherkin style keywords as examples: `Given`, `When`, `Then`, `And`, and `But`.

RSpec provides multiple ways to create and use shared example groups. These come in pairs, with one method for defining a shared group and another for using it. So, in RSpec, `shared_context` and `include_context` are for reusing common setup and helper logic whereas `shared_examples` and `include_examples` are for reusing examples. Specify hooks into this general mechanism and provides `shared_steps` and `include_steps`. These shared steps go into RSpec's "world," which is an internal container that is used for holding global non-configuration data.

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
