# Specify

> **The height of sophistication is simplicity.**<br>
> &nbsp;&nbsp;&nbsp;&nbsp;*Clare Boothe Brokaw*

---

Specify is a tool for leveraging RSpec to create an expressive DSL for test and data conditions. Specify will also provide test result reporting that recognizes the DSL.

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

Instructions coming soon.

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
