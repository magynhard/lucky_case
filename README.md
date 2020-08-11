# lucky_case

The lucky ruby gem to identify and convert strings from any letter case to another. Plus some extra functions.

Useful when working with conventions, where class names, method names and file names needs to be converted.

* Converters: Only characters, numbers, dashes and underlines are allowed inside a string.
* Must not start with dash or number, underlines at the beginning are allowed by default and can be allowed/removed/controlled by parameter (when used for private methods for example)




# Contents

* [Usage](#usage)
* [Installation](#installation)
* [Documentation](#documentation)
* [Contributing](#contributing)




<a name="usage"></a>
## Usage

You can either use the static LuckyCase class with its method or optionally monkey patch the String class.

### Use the static class only
```ruby
require 'lucky_case'

# converters
LuckyCase.snake_case('ExamplePascalString')            # => 'example_pascal_string'
LuckyCase.upper_snake_case('Example-Train-String')     # => 'EXAMPLE_TRAIN_STRING'
LuckyCase.pascal_case('example_snake_string')          # => 'ExampleSnakeString'
LuckyCase.camel_case('example-dash-string')            # => 'exampleDashString'
LuckyCase.dash_case('ExamplePascalString')             # => 'example-pascal-string'
LuckyCase.upper_dash_case('ExamplePascalString')       # => 'EXAMPLE-PASCAL-STRING'
LuckyCase.train_case('example_snake_string')           # => 'Example-Snake-String'
LuckyCase.mixed_case('example_snake_string')           # => 'Example-snake_STRING'
# converter by type
LuckyCase.convert_case('some_snake', :pascal_case)     # => 'SomeSnake'
# transformers
LuckyCase.lower_case('Some_FuckingShit')               # => 'some_fuckingshit'
LuckyCase.upper_case('Some_FuckingShit')               # => 'SOME_FUCKINGSHIT'
LuckyCase.swap_case('SomeSwappy_Case-Example')         # => 'sOMEsWAPPY-cASE_eXAMPLE'
LuckyCase.capital('example')                           # => 'Example'
LuckyCase.capitalize('example')                        # => 'Example'
LuckyCase.constantize('some_constant')                 # => SomeConstant
LuckyCase.constantize('SOME_CONSTANT')                 # => SomeConstant
LuckyCase.constantize('some/path_example/folder')      # => Some::PathExample::Folder
LuckyCase.deconstantize(SomeConstant)                  # => 'some_constant'
LuckyCase.deconstantize(Some::PathExample::Folder, case_type: :camel_case)     # => 'some/pathExample/folder'
# identifier
LuckyCase.case('this_can_only_be_snake_case')          # => :snake_case
LuckyCase.cases('multiple')                            # => [ :snake_case, :camel_case, :dash_case ]
# checkers
LuckyCase.snake_case?('valid_snake_case')              # => true
LuckyCase.upper_snake_case?('inValidSnakeCase')        # => false
LuckyCase.pascal_case?('PascalCase')                   # => true
LuckyCase.camel_case?('camelCase')                     # => true
LuckyCase.dash_case?('dash-case')                      # => true
LuckyCase.upper_dash_case?('DASH-CASE')                # => true
LuckyCase.train?('Train-Case')                         # => true
LuckyCase.mixed_case?('mixed_Case')                    # => true
LuckyCase.upper_case?('UPPER50984')                    # => true
LuckyCase.lower_case?('mixed_Case')                    # => true
LuckyCase.capital?('Some')                             # => true
LuckyCase.capitalized?('some')                         # => false
```

### Monkey patch the string class

With monkey patching you can access the same methods (except deconstantize) of LuckyCase directly from strings.
Additionally they provide versions with exclamation mark for direct manipulation.

```ruby
require 'lucky_case/string'

a = 'ExampleString'

a.pascal_case?                          # => true
a.snake_case                            # => 'example_string'
a                                       # => 'ExampleString'
# string variable manipulation
a.snake_case!                           # => 'example_string'
a                                       # => 'example_string'
```





<a name="installation"></a>
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lucky_case'
```

And then execute:

    $ bundle install

Or install it yourself by:

    $ gem install lucky_case




  
<a name="documentation"></a>    
## Documentation
Check out the doc at RubyDoc
<a href="https://www.rubydoc.info/gems/lucky_case">https://www.rubydoc.info/gems/lucky_case</a>





<a name="contributing"></a>    
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/magynhard/lucky_case. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

