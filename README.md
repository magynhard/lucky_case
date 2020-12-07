# lucky_case

The lucky ruby gem to identify and convert strings from any letter case to another. Plus some extra functions.

I also created a javascript port named [lucky-case](https://github.com/magynhard/lucky-case).

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

### Approach 1: Using the static class
```ruby
require 'lucky_case'

# converters
LuckyCase.snake_case('PascalToSnake')                  # => 'pascal_to_snake'
LuckyCase.upper_snake_case('Train-To-Upper-Snake')     # => 'TRAIN_TO_UPPER_SNAKE'
LuckyCase.pascal_case('snake_to_pascal')               # => 'SnakeToPascal'
LuckyCase.camel_case('dash-to-camel-case')             # => 'dashToCamelCase'
LuckyCase.dash_case('PascalToDashCase')                # => 'pascal-to-dash-case'
LuckyCase.upper_dash_case('PascalToUpperDash')         # => 'PASCAL-TO-UPPER-DASH'
LuckyCase.train_case('snake_to_train_case')            # => 'Snake-To-Train-Case'
LuckyCase.word_case('PascalToWordCase')                # => 'pascal to word case'
LuckyCase.upper_word_case('PascalToUpperWord')         # => 'PASCAL TO UPPER WORD'
LuckyCase.capital_word_case('snake_to_capital_word')   # => 'Snake To Capital Word'
LuckyCase.sentence_case('snake_to_sentence_case')      # => 'Snake to sentence case'
LuckyCase.mixed_case('example_snake_string')           # => 'Example-snake_STRING'

# converter by type
LuckyCase.convert_case('some_snake', :pascal_case)     # => 'SomeSnake'

# transformers
LuckyCase.lower_case('Some_FuckingShit')               # => 'some_fuckingshit'
LuckyCase.upper_case('Some_FuckingShit')               # => 'SOME_FUCKINGSHIT'
LuckyCase.capital('example')                           # => 'Example'
LuckyCase.capitalize('example')                        # => 'Example'
LuckyCase.swap_case('SomeSwappy_Case-Example')         # => 'sOMEsWAPPY-cASE_eXAMPLE'
LuckyCase.constantize('some_constant')                 # => SomeConstant
LuckyCase.constantize('SOME_CONSTANT')                 # => SomeConstant
LuckyCase.constantize('some/path_example/folder')      # => Some::PathExample::Folder
LuckyCase.deconstantize(SomeConstant)                  # => 'some_constant' // default case_type: :snake_case
LuckyCase.deconstantize(Some::PathExample::Folder, case_type: :camel_case)  # => 'some/pathExample/folder'

# identifiers
LuckyCase.case('this_can_only_be_snake_case')          # => :snake_case
LuckyCase.cases('validformultiple')                    # => [ :snake_case, :camel_case, :dash_case, :word_case ]

# checkers
LuckyCase.snake_case?('valid_snake_case')              # => true
LuckyCase.upper_snake_case?('UPPER_SNAKE')             # => true
LuckyCase.pascal_case?('PascalCase')                   # => true
LuckyCase.camel_case?('camelCase')                     # => true
LuckyCase.dash_case?('dash-case')                      # => true
LuckyCase.upper_dash_case?('DASH-CASE')                # => true
LuckyCase.train_case?('Train-Case')                    # => true
LuckyCase.word_case?('word case')                      # => true
LuckyCase.upper_word_case?('UPPER WORD CASE')          # => true
LuckyCase.capital_word_case?('Capital Word Case')      # => true
LuckyCase.sentence_case?('Sentence case string')       # => true
LuckyCase.mixed_case?('mixed_Case')                    # => true
LuckyCase.upper_case?('UPPER50984')                    # => true
LuckyCase.lower_case?('lower_cheese')                  # => true
LuckyCase.capital?('Some')                             # => true
LuckyCase.capitalized?('some')                         # => false
LuckyCase.valid_case_type?(:snake_case)                # => true
LuckyCase.valid_case_type?(:apple_case)                # => false
LuckyCase.valid_case_string?('validString')            # => true
LuckyCase.valid_case_string?('1nV4lid$tring')          # => false
```

### Approach 2: Monkey patch the string class

With monkey patching you can access the same methods (except `#deconstantize`, `#valid_case_type?`) of LuckyCase directly from strings.
Additionally they provide versions with exclamation mark for direct manipulation.

Because the methods `#case` and `#cases` are so general and could lead to conflicts, they are called `#letter_case` and `#letter_cases` at strings.

```ruby
require 'lucky_case/string'

a = 'ExampleString'

a.pascal_case?                          # => true
a.snake_case                            # => 'example_string'
a                                       # => 'ExampleString'

# string variable manipulation
a.snake_case!                           # => 'example_string'
a                                       # => 'example_string'
...

# identifiers
# got a other method name here because 'case' might be to common and cause conflicts
b = 'example'
b.letter_case                           # => :snake_case
b.letter_cases                          # => [ :snake_case, :camel_case, :dash_case, :word_case ]
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

