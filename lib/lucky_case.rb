require 'lucky_case/version'

require_relative 'custom_errors/invalid_case_error'


# LuckyCase
#
# Convert and detect various letter cases in strings
#

module LuckyCase

  CASES = {
      snake_case: /^[[:lower:]]{1}[[:lower:]_0-9]+$/,
      upper_snake_case: /^[[:upper:]]{1}[[:upper:]_0-9]+$/,
      pascal_case: /^[[:upper:]]{1}[[:upper:][:lower:]0-9]+$/,
      camel_case: /^[[:lower:]]{1}[[:upper:][:lower:]0-9]+$/,
      dash_case: /^([[:lower:]]){1}[[:lower:]\-0-9]*[[:lower:]0-9]+$/,
      upper_dash_case: /^([[:upper:]]){1}[[:upper:]\-0-9]*[[:upper:]0-9]+$/,
      train_case: /^([[:upper:]][[:lower:]0-9]*\-|[0-9]+\-)*([[:upper:]][[:lower:]0-9]*)$/,
      word_case: /^[[:lower:]]{1}[[:lower:] 0-9]+$/,
      upper_word_case: /^[[:upper:]]{1}[[:upper:] 0-9]+$/,
      capital_word_case: /^([[:upper:]][[:lower:]0-9]*\ |[0-9]+\ )*([[:upper:]][[:lower:]0-9]*)$/,
      sentence_case: /^[[:upper:]]{1}[[:lower:] 0-9]+$/,
      mixed_case: /^[[:upper:][:lower:]][[:upper:][:lower:]_\-0-9 ]*$/,
  }

  FORMATS = {
      capital: /^[[:upper:]]{1}.*$/,
      upper_case: /^[^[:lower:]]+$/,
      lower_case: /^[^[:upper:]]+$/,
  }

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
  # @param [String] string
  # @param [Boolean] allow_prefixed_underscores
  # @return [Symbol,nil] symbol of type, nil if no match
  def self.case(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    CASES.each do |case_type, regex|
      if s =~ regex
        return case_type
      end
    end
    nil
  end

  # Get types of cases of string (keys of LuckyCase.CASES)
  #
  # @param [String] string
  # @param [Boolean] allow_prefixed_underscores
  # @return [Array<Symbol>,nil] symbols of types, nil if no one matches
  def self.cases(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    matched_cases = []
    CASES.each do |case_type, regex|
      if s =~ regex
        matched_cases.push case_type
      end
    end
    if matched_cases.empty?
      nil
    elsif matched_cases.size > 1
      # reject :mixed_case if there are other matches
      # because it would always be included if one other case matches
      matched_cases.reject { |e| e == :mixed_case }
    else
      matched_cases
    end
  end

  # Convert a string into the given case type
  #
  # @param [String] string
  # @param [Symbol,String] case_type
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.convert_case(string, case_type, preserve_prefixed_underscores: true)
    type = case_type.to_sym
    if CASES.include? case_type.to_sym
      return self.send type.to_s, string, preserve_prefixed_underscores: preserve_prefixed_underscores
    end
    error_message = "Invalid case type '#{case_type}'. Valid types are: #{CASES.keys.join(', ')}"
    raise InvalidCaseError.new error_message
  end

  # Check if given case type is a valid case type
  # 
  # @param [Symbol, String] case_type
  # @return [Boolean]
  def self.valid_case_type?(case_type)
    if CASES.keys.include? case_type.to_sym
      true
    else
      false
    end
  end

  # Check if the string matches any of the available cases
  # 
  # @param [String] string
  # @return [Boolean]
  def self.valid_case_string?(string)
    self.case(string) != nil
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
  # @param [String] string to convert
  # @return [String]
  def self.upper_case(string)
    string.upcase
  end

  # Check if all characters inside the string are upper case
  #
  # @param [String] string to check
  # @return [Boolean]
  def self.upper_case?(string)
    string == upper_case(string)
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
  # @param [String] string to convert
  # @return [String]
  def self.lower_case(string)
    string.downcase
  end

  # Check if all characters inside the string are lower case
  #
  # @param [String] string to check
  # @return [Boolean]
  def self.lower_case?(string)
    string == lower_case(string)
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
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.snake_case(string, preserve_prefixed_underscores: true)
    a = split_case_string string
    converted = a.join('_')
    if preserve_prefixed_underscores
      underscores_at_start(string) + converted
    else
      converted
    end
  end

  # Check if the string is snake case
  #
  # @param [String] string to check
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def self.snake_case?(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :snake_case
  end

  # Convert the given string from any case
  # into upper snake case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'THIS_IS_AN_EXAMPLE_STRING'
  #
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.upper_snake_case(string, preserve_prefixed_underscores: true)
    a = split_case_string string
    converted = a.map { |e| upper_case e }.join('_')
    if preserve_prefixed_underscores
      underscores_at_start(string) + converted
    else
      converted
    end
  end

  # Check if the string is upper snake case
  #
  # @param [String] string to check
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def self.upper_snake_case?(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :upper_snake_case
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
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.pascal_case(string, preserve_prefixed_underscores: true)
    a = split_case_string string
    converted = a.map { |e| capital e }.join('')
    if preserve_prefixed_underscores
      underscores_at_start(string) + converted
    else
      converted
    end
  end

  # Check if the string is upper pascal case
  #
  # @param [String] string to check
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def self.pascal_case?(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :pascal_case
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
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.camel_case(string, preserve_prefixed_underscores: true)
    a = split_case_string string
    converted = ([a[0]] + a[1..-1].map { |e| capital e }).join('')
    if preserve_prefixed_underscores
      underscores_at_start(string) + converted
    else
      converted
    end
  end

  # Check if the string is camel case
  #
  # @param [String] string to check
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def self.camel_case?(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :camel_case
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
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.dash_case(string, preserve_prefixed_underscores: true)
    a = split_case_string string
    converted = a.join('-')
    if preserve_prefixed_underscores
      underscores_at_start(string) + converted
    else
      converted
    end
  end

  # Check if the string is dash case
  #
  # @param [String] string to check
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def self.dash_case?(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :dash_case
  end

  # Convert the given string from any case
  # into upper dash case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'THIS-IS-AN-EXAMPLE-STRING'
  #
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.upper_dash_case(string, preserve_prefixed_underscores: true)
    s = dash_case string, preserve_prefixed_underscores: preserve_prefixed_underscores
    upper_case s
  end

  # Check if the string is upper dash case
  #
  # @param [String] string to check
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def self.upper_dash_case?(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :upper_dash_case
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
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.train_case(string, preserve_prefixed_underscores: true)
    a = split_case_string string
    converted = a.map { |e| capital e }.join('-')
    if preserve_prefixed_underscores
      underscores_at_start(string) + converted
    else
      converted
    end
  end

  # Check if the string is train case
  #
  # @param [String] string to check
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def self.train_case?(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :train_case
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
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.word_case(string, preserve_prefixed_underscores: true)
    a = split_case_string string
    converted = a.join(' ')
    if preserve_prefixed_underscores
      underscores_at_start(string) + converted
    else
      converted
    end
  end

  # Check if the string is word case
  #
  # @param [String] string to check
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def self.word_case?(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :word_case
  end

  # Convert the given string from any case
  # into upper word case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'THIS IS AN EXAMPLE STRING'
  #
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.upper_word_case(string, preserve_prefixed_underscores: true)
    a = split_case_string string
    converted = a.map { |e| upper_case e }.join(' ')
    if preserve_prefixed_underscores
      underscores_at_start(string) + converted
    else
      converted
    end
  end

  # Check if the string is upper word case
  #
  # @param [String] string to check
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def self.upper_word_case?(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :upper_word_case
  end

  # Convert the given string from any case
  # into capital word case
  #
  # @example conversion
  #   'this-isAnExample_string' => 'This Is An Example String'
  #
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.capital_word_case(string, preserve_prefixed_underscores: true)
    a = split_case_string string
    converted = a.map { |e| capital e }.join(' ')
    if preserve_prefixed_underscores
      underscores_at_start(string) + converted
    else
      converted
    end
  end

  # Check if the string is capital word case
  #
  # @param [String] string to check
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def self.capital_word_case?(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :capital_word_case
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
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.sentence_case(string, preserve_prefixed_underscores: true)
    a = split_case_string string
    converted = capital(a.join(' '))
    if preserve_prefixed_underscores
      underscores_at_start(string) + converted
    else
      converted
    end
  end

  # Check if the string is sentence case
  #
  # @param [String] string to check
  # @param [Boolean] allow_prefixed_underscores
  # @return [Boolean]
  def self.sentence_case?(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :sentence_case
  end

  #----------------------------------------------------------------------------------------------------
  # CAPITALIZE
  #----------------------------------------------------------------------------------------------------

  # Convert the first character to capital
  #
  # @param [String] string to convert
  # @param [Boolean] skip_prefixed_underscores
  # @return [String]
  def self.capital(string, skip_prefixed_underscores: false)
    return string if string.empty?
    s = if skip_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    s = s[0].upcase + s[1..-1]
    if skip_prefixed_underscores
      underscores_at_start(string) + s
    else
      s
    end
  end

  # Convert the first character to capital
  #
  # @param [String] string to convert
  # @param [Boolean] skip_prefixed_underscores
  # @return [String]
  def self.capitalize(string, skip_prefixed_underscores: false)
    capital string, skip_prefixed_underscores: skip_prefixed_underscores
  end

  # Check if the strings first character is a capital letter
  #
  # @param [String] string to check
  # @param [Boolean] skip_prefixed_underscores
  # @return [Boolean]
  def self.capital?(string, skip_prefixed_underscores: false)
    s = if skip_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :capital
  end

  # Check if the strings first character is a capital letter
  #
  # @param [String] string to check
  # @param [Boolean] skip_prefixed_underscores
  # @return [Boolean]
  def self.capitalized?(string, skip_prefixed_underscores: false)
    capital? string, skip_prefixed_underscores: skip_prefixed_underscores
  end

  #----------------------------------------------------------------------------------------------------
  # MIXED CASE
  #----------------------------------------------------------------------------------------------------

  # Convert the given string from any case
  # into mixed case.
  #
  # The new string is ensured to be different from the input.
  #
  # @example conversion
  #   'this-isAnExample_string' => 'This-Is_anExample-string'
  #
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.mixed_case(string, preserve_prefixed_underscores: true)
    a = split_case_string string
    converted = nil
    loop do
      converted = ''
      a.each do |part|
        converted += self.send CASES.keys.sample, part
      end
      converted = self.send CASES.keys.sample, converted
      break if converted != string && underscores_at_start(string) + converted != string
    end
    if preserve_prefixed_underscores
      underscores_at_start(string) + converted
    else
      converted
    end
  end

  # Check if the string is a valid mixed case (without special characters!)
  #
  # @param [String] string to check
  # @return [Boolean]
  def self.mixed_case?(string, allow_prefixed_underscores: true)
    s = if allow_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    _case_match? s, :mixed_case
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
  # @param [String] string
  # @param [Boolean] preserve_prefixed_underscores
  # @return [String]
  def self.swap_case(string, preserve_prefixed_underscores: false)
    s = if preserve_prefixed_underscores
          cut_underscores_at_start string
        else
          string
        end
    sp = s.split('')
    sp.each_with_index do |char, i|
      if char == '_'
        sp[i] = '-'
      elsif char == '-'
        sp[i] = '_'
      elsif lower_case? char
        sp[i] = upper_case char
      elsif upper_case? char
        sp[i] = lower_case char
      end
    end
    sp = sp.join('')
    if preserve_prefixed_underscores
      underscores_at_start(string) + sp
    else
      sp
    end
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
  # @param [String] string to convert
  # @param [Boolean] preserve_prefixed_underscores
  # @return [Constant]
  def self.constantize(string)
    s = string.gsub('/', '::')
    constants = if s.include? '::'
                  s.split('::')
                else
                  [s]
                end
    final_constant = constants.map { |e| pascal_case(e, preserve_prefixed_underscores: false) }.reject(&:empty?).join('::')
    Object.const_get(final_constant)
  end

  # Deconverts the constant back into specified target type
  #
  # @example deconversion
  #   This::AweSome::Constant => 'this/awe_some/constant'
  #
  # @param [Constant] constant to reconvert
  # @param [Symbol,String] target can be :path, :string
  # @param [Symbol,String] case_type can be any valid case of CASES
  # @return [String]
  def self.deconstantize(constant, target: :path, case_type: nil)
    # defaults if none is set, depending on target
    unless case_type
      case_type = case target.to_sym
                  when :path
                    :snake_case
                  when :string
                    :pascal_case
                  end
    end
    s = constant.name
    split = if s.include? '::'
              s.split('::')
            else
              [s]
            end
    reconverted_parts = split.map { |e| convert_case e, case_type }
    case target.to_sym
    when :path
      reconverted_parts.join('/')
    when :string
      reconverted_parts.join('::')
    end
  end

  #----------------------------------------------------------------------------------------------------
  # HELPERS
  #----------------------------------------------------------------------------------------------------

  # Return string without underscores at the start
  #
  # @param [String] string
  # @return [String] string without prefixed underscores
  def self.cut_underscores_at_start(string)
    underscore_counter = 0
    string.split('').each do |c|
      if c == '_'
        underscore_counter += 1
      else
        break
      end
    end
    string[underscore_counter..-1]
  end

  # Return the underscores at the start of the string
  #
  # @param [String] string
  # @return [String] string of underscores or empty if none found
  def self.underscores_at_start(string)
    underscore_counter = 0
    string.split('').each do |c|
      if c == '_'
        underscore_counter += 1
      else
        break
      end
    end
    '_' * underscore_counter
  end

  # Split the string into parts
  # It is splitted by all (different) case separators
  #
  # @param [String] string
  # @return [Array<String>]
  def self.split_case_string(string)
    s = cut_underscores_at_start string
    s = s.gsub(/([[:upper:]])/, '_\1') unless upper_case? s # prepend all upper characters with underscore
    s = s.gsub(' ', '_') # replace all spaces with underscore
    s = s.gsub('-', '_') # replace all dashes with underscore
    s = cut_underscores_at_start s
    s.downcase.split('_').reject(&:empty?) # split everything by underscore
  end

  private

  # Check if the given case matches the string
  #
  # @param [String] string
  # @param [Symbol,String] case_type
  # @return [Boolean]
  def self._case_match?(string, case_type)
    !!(string =~ CASES[case_type.to_sym])
  end

  #----------------------------------------------------------------------------------------------------

end