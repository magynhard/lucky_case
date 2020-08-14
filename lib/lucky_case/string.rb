
require_relative '../lucky_case'

# LuckyCase version to add methods directly to string by monkey patching
#
#   can be included this way by
#   require 'lucky_case/string'
#

class String

  # Get type of case of string (one key of LuckyCase.CASES)
  #
  # If more than one case matches, the first match wins.
  # Match prio is the order of the regex in LuckyCase.CASES
  #
  # If you want or need to know all cases, use plural version of this method
  #
  # If you want to check explicitly for one case, use its check method,
  # e.g. snake_case? for snake_case, etc...
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Symbol,nil] symbol of type, nil if no match
  def lucky_case(allow_prefixed_underscores: true)
    LuckyCase.case self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  # Get types of cases of string (keys of LuckyCase.CASES)
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Array<Symbol>,nil] symbols of types, nil if no one matches
  def lucky_cases(allow_prefixed_underscores: true)
    LuckyCase.cases self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  # Convert a string into the given case type
  #
  # @param [Symbol,String] case_type
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def convert_case(case_type, preserve_prefixed_underscores: true)
    LuckyCase.convert_case self, case_type, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def convert_case!(case_type, preserve_prefixed_underscores: true)
    set_self_value self.convert_case(case_type, preserve_prefixed_underscores: preserve_prefixed_underscores)
  end

  #----------------------------------------------------------------------------------------------------
  # UPPER CASE
  #----------------------------------------------------------------------------------------------------

  # Convert all characters inside the string
  # into upper case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'THIS-ISANEXAMPLE_STRING'
  #
  # @return [String]
  def upper_case()
    LuckyCase.upper_case self
  end

  def upper_case!()
    set_self_value self.upper_case
  end

  # Check if all characters inside the string are upper case
  #
  # @return [Boolean]
  def upper_case?()
    LuckyCase.upper_case? self
  end

  #----------------------------------------------------------------------------------------------------
  # LOWER CASE
  #----------------------------------------------------------------------------------------------------

  # Convert all characters inside the string
  # into lower case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'this-isanexample_string'
  #
  # @return [String]
  def lower_case()
    LuckyCase.lower_case self
  end

  def lower_case!()
    set_self_value self.lower_case
  end

  # Check if all characters inside the string are lower case
  #
  # @return [Boolean]
  def lower_case?()
    LuckyCase.lower_case? self
  end

  #----------------------------------------------------------------------------------------------------
  # SNAKE CASE
  #----------------------------------------------------------------------------------------------------

  # Convert the given string from any case
  # into snake case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'this_is_an_example_string'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def snake_case(preserve_prefixed_underscores: true)
    LuckyCase.snake_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def snake_case!(preserve_prefixed_underscores: true)
    set_self_value self.snake_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  # Check if the string is snake case
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def snake_case?(allow_prefixed_underscores: true)
    LuckyCase.snake_case? self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  # Convert the given string from any case
  # into upper snake case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'THIS_IS_AN_EXAMPLE_STRING'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def upper_snake_case(preserve_prefixed_underscores: true)
    LuckyCase.upper_snake_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def upper_snake_case!(preserve_prefixed_underscores: true)
    set_self_value self.upper_snake_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  # Check if the string is upper snake case
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def upper_snake_case?(allow_prefixed_underscores: true)
    LuckyCase.upper_snake_case? self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  #----------------------------------------------------------------------------------------------------
  # PASCAL CASE
  #----------------------------------------------------------------------------------------------------

  # Convert the given string from any case
  # into pascal case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'ThisIsAnExampleString'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def pascal_case(preserve_prefixed_underscores: true)
    LuckyCase.pascal_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def pascal_case!(preserve_prefixed_underscores: true)
    set_self_value self.pascal_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  # Check if the string is upper pascal case
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def pascal_case?(allow_prefixed_underscores: true)
    LuckyCase.pascal_case? self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  #----------------------------------------------------------------------------------------------------
  # CAMEL CASE
  #----------------------------------------------------------------------------------------------------

  # Convert the given string from any case
  # into camel case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'thisIsAnExampleString'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def camel_case(preserve_prefixed_underscores: true)
    LuckyCase.camel_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def camel_case!(preserve_prefixed_underscores: true)
    set_self_value self.camel_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  # Check if the string is camel case
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def camel_case?(allow_prefixed_underscores: true)
    LuckyCase.camel_case? self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  #----------------------------------------------------------------------------------------------------
  # DASH CASE
  #----------------------------------------------------------------------------------------------------

  # Convert the given string from any case
  # into dash case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'this-is-an-example-string'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def dash_case(preserve_prefixed_underscores: true)
    LuckyCase.dash_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def dash_case!(preserve_prefixed_underscores: true)
    set_self_value self.dash_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  # Check if the string is dash case
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def dash_case?(allow_prefixed_underscores: true)
    LuckyCase.dash_case? self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  # Convert the given string from any case
  # into upper dash case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'THIS-IS-AN-EXAMPLE-STRING'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def upper_dash_case(preserve_prefixed_underscores: true)
    LuckyCase.upper_dash_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def upper_dash_case!(preserve_prefixed_underscores: true)
    set_self_value self.upper_dash_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  # Check if the string is upper dash case
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def upper_dash_case?(allow_prefixed_underscores: true)
    LuckyCase.upper_dash_case? self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  #----------------------------------------------------------------------------------------------------
  # TRAIN CASE
  #----------------------------------------------------------------------------------------------------

  # Convert the given string from any case
  # into train case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'This-Is-An-Example-String'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def train_case(preserve_prefixed_underscores: true)
    LuckyCase.train_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def train_case!(preserve_prefixed_underscores: true)
    set_self_value self.train_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  # Check if the string is train case
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def train_case?(allow_prefixed_underscores: true)
    LuckyCase.train_case? self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  #----------------------------------------------------------------------------------------------------
  # WORD CASE
  #----------------------------------------------------------------------------------------------------

  # Convert the given string from any case
  # into word case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'this is an example string'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def word_case(preserve_prefixed_underscores: true)
    LuckyCase.word_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def word_case!(preserve_prefixed_underscores: true)
    set_self_value self.word_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  # Check if the string is word case
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def word_case?(allow_prefixed_underscores: true)
    LuckyCase.word_case? self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  # Convert the given string from any case
  # into upper word case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'THIS IS AN EXAMPLE STRING'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def upper_word_case(preserve_prefixed_underscores: true)
    LuckyCase.upper_word_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def upper_word_case!(preserve_prefixed_underscores: true)
    set_self_value self.upper_word_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  # Check if the string is upper word case
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def upper_word_case?(allow_prefixed_underscores: true)
    LuckyCase.upper_word_case? self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  # Convert the given string from any case
  # into capital word case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'This Is An Example String'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def capital_word_case(preserve_prefixed_underscores: true)
    LuckyCase.capital_word_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def capital_word_case!(preserve_prefixed_underscores: true)
    set_self_value self.capital_word_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  # Check if the string is capital word case
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def capital_word_case?(allow_prefixed_underscores: true)
    LuckyCase.capital_word_case? self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  #----------------------------------------------------------------------------------------------------
  # SENTENCE CASE
  #----------------------------------------------------------------------------------------------------

  # Convert the given string from any case
  # into sentence case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'This is an example string'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def sentence_case(preserve_prefixed_underscores: true)
    LuckyCase.sentence_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def sentence_case!(preserve_prefixed_underscores: true)
    set_self_value self.sentence_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  # Check if the string is sentence case
  #
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def sentence_case?(allow_prefixed_underscores: true)
    LuckyCase.sentence_case? self, allow_prefixed_underscores: allow_prefixed_underscores
  end

  #----------------------------------------------------------------------------------------------------
  # CAPITALIZE
  #----------------------------------------------------------------------------------------------------

  # Convert the first character to capital
  #
  # @param [Boolean] skip_prefixed_underscores
  # @return [String]
  def capital(skip_prefixed_underscores: false)
    LuckyCase.capitalize self, skip_prefixed_underscores: skip_prefixed_underscores
  end

  # Convert the first character to capital
  #
  # @param [Boolean] skip_prefixed_underscores
  # @return [String]
  def capitalize(skip_prefixed_underscores: false)
    self.capital skip_prefixed_underscores: skip_prefixed_underscores
  end

  def capital!(skip_prefixed_underscores: false)
    set_self_value self.capitalize skip_prefixed_underscores: skip_prefixed_underscores
  end

  def capitalize!(skip_prefixed_underscores: false)
    self.capital! skip_prefixed_underscores: skip_prefixed_underscores
  end

  # Check if the strings first character is a capital letter
  #
  # @param [Boolean] skip_prefixed_underscores
  # @return [Boolean]
  def capital?(skip_prefixed_underscores: false)
    LuckyCase.capital? self, skip_prefixed_underscores: skip_prefixed_underscores
  end

  # Check if the strings first character is a capital letter
  #
  # @param [Boolean] skip_prefixed_underscores
  # @return [Boolean]
  def capitalized?(skip_prefixed_underscores: false)
    self.capital? skip_prefixed_underscores: skip_prefixed_underscores
  end

  #----------------------------------------------------------------------------------------------------
  # MIXED CASE
  #----------------------------------------------------------------------------------------------------

  # Convert the given string from any case
  # into mixed case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'This-Is_anExample-string'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def mixed_case(preserve_prefixed_underscores: true)
    LuckyCase.mixed_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  def mixed_case!(preserve_prefixed_underscores: true)
    set_self_value self.mixed_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  # Check if the string is a valid mixed case (without special characters!)
  #
  # @return [Boolean]
  def mixed_case?()
    LuckyCase.mixed_case? self
  end

  #----------------------------------------------------------------------------------------------------
  # SWAP CASE
  #----------------------------------------------------------------------------------------------------

  # Swaps character cases in string
  #
  # lower case to upper case
  # upper case to lower case
  # dash to underscore
  # underscore to dash
  #
  # @example conversion
  #   'this-isAnExample_string' => 'THIS_ISaNeXAMPLE-STRING'
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def swap_case(preserve_prefixed_underscores: false)
    LuckyCase.swap_case self, preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  #----------------------------------------------------------------------------------------------------

  def swap_case!(preserve_prefixed_underscores: false)
    set_self_value self.swap_case preserve_prefixed_underscores: preserve_prefixed_underscores
  end

  #----------------------------------------------------------------------------------------------------
  # CONSTANTIZE
  #----------------------------------------------------------------------------------------------------

  # Convert the string from any case
  # into pascal case and casts it into a constant
  #
  # @example conversion
  #   'this-isAnExample_string' => ThisIsAnExampleString
  #   'this/is_an/example_path' => This::IsAn::ExamplePath
  #
  # @param [Boolean] preserve_prefixed_underscores
  # @return [Constant]
  def constantize()
    LuckyCase.constantize self
  end

  #----------------------------------------------------------------------------------------------------
  # HELPERS
  #----------------------------------------------------------------------------------------------------

  private
  
  def set_self_value(val)
    self.gsub!(self, val)
  end
  
end