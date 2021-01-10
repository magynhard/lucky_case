require 'spec_helper'
require 'lucky_case'

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase do
  it "has a version number" do
    expect(LuckyCase::VERSION).not_to be nil
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe String do
  it "not been monkey patched" do
    expect { "String".letter_case }.to raise_error(NoMethodError)
    expect { "String".upper_case }.to raise_error(NoMethodError)
    expect { "String".snake_case }.to raise_error(NoMethodError)
    expect { "String".capital }.to raise_error(NoMethodError)
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase, '#split_case_string' do
  context 'Splitting variants without prefixed underscores: ' do
    it 'can split snake case' do
      result = LuckyCase.split_case_string('snake_case_string')
      expect(result).to eql(%w[snake case string])
    end
    it 'can split upper snake case' do
      result = LuckyCase.split_case_string('UPPER_SNAKE_CASE_STRING')
      expect(result).to eql(%w[upper snake case string])
    end
    it 'can split pascal case' do
      result = LuckyCase.split_case_string('PascalCaseString')
      expect(result).to eql(%w[pascal case string])
    end
    it 'can split camel case' do
      result = LuckyCase.split_case_string('camelCaseString')
      expect(result).to eql(%w[camel case string])
    end
    it 'can split dash case' do
      result = LuckyCase.split_case_string('dash-case-string')
      expect(result).to eql(%w[dash case string])
    end
    it 'can split upper dash case' do
      result = LuckyCase.split_case_string('UPPER-DASH-CASE-STRING')
      expect(result).to eql(%w[upper dash case string])
    end
    it 'can split train case' do
      result = LuckyCase.split_case_string('Train-Case-String')
      expect(result).to eql(%w[train case string])
    end
    it 'can split word case' do
      result = LuckyCase.split_case_string('word case string')
      expect(result).to eql(%w[word case string])
    end
    it 'can split upper word case' do
      result = LuckyCase.split_case_string('UPPER WORD CASE')
      expect(result).to eql(%w[upper word case])
    end
    it 'can split capital word case' do
      result = LuckyCase.split_case_string('Capital Word Case')
      expect(result).to eql(%w[capital word case])
    end
    it 'can split sentence case' do
      result = LuckyCase.split_case_string('Sentence case string')
      expect(result).to eql(%w[sentence case string])
    end
    it 'can split mixed case' do
      result = LuckyCase.split_case_string('mixed_Case-string')
      expect(result).to eql(%w[mixed case string])
    end
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase, '#split_case_string' do
  context 'Splitting variants with prefixed underscores: ' do
    it 'can split snake case' do
      result = LuckyCase.split_case_string('_snake_case_string')
      expect(result).to eql(%w[snake case string])
    end
    it 'can split upper snake case' do
      result = LuckyCase.split_case_string('__UPPER_SNAKE_CASE_STRING')
      expect(result).to eql(%w[upper snake case string])
    end
    it 'can split pascal case' do
      result = LuckyCase.split_case_string('___PascalCaseString')
      expect(result).to eql(%w[pascal case string])
    end
    it 'can split camel case' do
      result = LuckyCase.split_case_string('____camelCaseString')
      expect(result).to eql(%w[camel case string])
    end
    it 'can split dash case' do
      result = LuckyCase.split_case_string('_____dash-case-string')
      expect(result).to eql(%w[dash case string])
    end
    it 'can split upper dash case' do
      result = LuckyCase.split_case_string('____UPPER-DASH-CASE-STRING')
      expect(result).to eql(%w[upper dash case string])
    end
    it 'can split train case' do
      result = LuckyCase.split_case_string('___Train-Case-String')
      expect(result).to eql(%w[train case string])
    end
    it 'can split word case' do
      result = LuckyCase.split_case_string('___word case string')
      expect(result).to eql(%w[word case string])
    end
    it 'can split upper word case' do
      result = LuckyCase.split_case_string('___UPPER WORD CASE STRING')
      expect(result).to eql(%w[upper word case string])
    end
    it 'can split capital word case' do
      result = LuckyCase.split_case_string('___Capital Word Case String')
      expect(result).to eql(%w[capital word case string])
    end
    it 'can split sentence case' do
      result = LuckyCase.split_case_string('___Sentence case string')
      expect(result).to eql(%w[sentence case string])
    end
    it 'can split mixed case' do
      result = LuckyCase.split_case_string('__mixed_Case-string')
      expect(result).to eql(%w[mixed case string])
    end
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase, '#case' do
  context 'Detecting variants without prefixed underscores: ' do
    it 'can detect snake case' do
      result = LuckyCase.case('snake_case_string')
      expect(result).to eql(:snake_case)
    end
    it 'can detect upper snake case' do
      result = LuckyCase.case('UPPER_SNAKE_CASE_STRING')
      expect(result).to eql(:upper_snake_case)
    end
    it 'can detect pascal case' do
      result = LuckyCase.case('PascalCaseString')
      expect(result).to eql(:pascal_case)
    end
    it 'can detect camel case' do
      result = LuckyCase.case('camelCaseString')
      expect(result).to eql(:camel_case)
    end
    it 'can detect dash case' do
      result = LuckyCase.case('dash-case-string')
      expect(result).to eql(:dash_case)
    end
    it 'can detect upper dash case' do
      result = LuckyCase.case('UPPER-DASH-CASE-STRING')
      expect(result).to eql(:upper_dash_case)
    end
    it 'can detect train case' do
      result = LuckyCase.case('Train-Case-String')
      expect(result).to eql(:train_case)
    end
    it 'can detect word case' do
      result = LuckyCase.case('word case string')
      expect(result).to eql(:word_case)
    end
    it 'can detect upper word case' do
      result = LuckyCase.case('UPPER WORD CASE STRING')
      expect(result).to eql(:upper_word_case)
    end
    it 'can detect capital word case' do
      result = LuckyCase.case('Capital Word Case String')
      expect(result).to eql(:capital_word_case)
    end
    it 'can detect sentence case' do
      result = LuckyCase.case('Sentence case string')
      expect(result).to eql(:sentence_case)
    end
    it 'can detect mixed case' do
      result = LuckyCase.case('mixed_Case-string')
      expect(result).to eql(:mixed_case)
    end
    it 'can detect unknown case' do
      result = LuckyCase.case('mi%&/xed_Case-string')
      expect(result).to eql(nil)
    end
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase, '#case' do
  context 'Detecting variants with prefixed underscores: ' do
    it 'can detect snake case' do
      result = LuckyCase.case('_____snake_case_string')
      expect(result).to eql(:snake_case)
    end
    it 'can detect upper snake case' do
      result = LuckyCase.case('____UPPER_SNAKE_CASE_STRING')
      expect(result).to eql(:upper_snake_case)
    end
    it 'can detect pascal case' do
      result = LuckyCase.case('___PascalCaseString')
      expect(result).to eql(:pascal_case)
    end
    it 'can detect camel case' do
      result = LuckyCase.case('__camelCaseString')
      expect(result).to eql(:camel_case)
    end
    it 'can detect dash case' do
      result = LuckyCase.case('_dash-case-string')
      expect(result).to eql(:dash_case)
    end
    it 'can detect upper dash case' do
      result = LuckyCase.case('__UPPER-DASH-CASE-STRING')
      expect(result).to eql(:upper_dash_case)
    end
    it 'can detect train case' do
      result = LuckyCase.case('___Train-Case-String')
      expect(result).to eql(:train_case)
    end
    it 'can detect word case' do
      result = LuckyCase.case('___word case string')
      expect(result).to eql(:word_case)
    end
    it 'can detect upper word case' do
      result = LuckyCase.case('___WORD CASE STRING')
      expect(result).to eql(:upper_word_case)
    end
    it 'can detect capital word case' do
      result = LuckyCase.case('___Word Case String')
      expect(result).to eql(:capital_word_case)
    end
    it 'can detect sentence case' do
      result = LuckyCase.case('___Sentence case string')
      expect(result).to eql(:sentence_case)
    end
    it 'can detect mixed case' do
      result = LuckyCase.case('____mixed_Case-string')
      expect(result).to eql(:mixed_case)
    end
    it 'can detect unknown case' do
      result = LuckyCase.case('_____mi%&/xed_Case-string')
      expect(result).to eql(nil)
    end
    it 'can detect invalid unknown case' do
      result = LuckyCase.case('Not-Unknown-Case')
      expect(result).not_to eql(nil)
    end
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase do
  context 'Checking variants without prefixed underscores: ' do
    all_cases = {
        snake_case: 'snake_case_string',
        upper_snake_case: 'UPPER_SNAKE_CASE_STRING',
        pascal_case: 'PascalCaseString',
        camel_case: 'camelCaseString',
        dash_case: 'dash-case-string',
        upper_dash_case: 'UPPER-DASH-CASE-STRING',
        train_case: 'Train-Case-String',
        word_case: 'word case string',
        upper_word_case: 'UPPER WORD CASE STRING',
        capital_word_case: 'Capital Word Case String',
        sentence_case: 'Sentence case string',
    }
    it 'can check valid snake case' do
      result = LuckyCase.snake_case?(all_cases[:snake_case])
      expect(result).to eql(true)
    end
    it 'can check invalid snake case' do
      all_cases.reject { |k, v| k == :snake_case }.each do |k, v|
        result = LuckyCase.snake_case?(v)
        expect(result).to eql(false), "Failed with '#{k}'"
      end
    end
    it 'can check valid upper snake case' do
      result = LuckyCase.upper_snake_case?(all_cases[:upper_snake_case])
      expect(result).to eql(true)
    end
    it 'can check invalid upper snake case' do
      all_cases.reject { |k, v| k == :upper_snake_case }.each do |k, v|
        result = LuckyCase.upper_snake_case?(v)
        expect(result).to eql(false), "Failed with '#{k}'"
      end
    end
    it 'can check valid pascal case' do
      result = LuckyCase.pascal_case?(all_cases[:pascal_case])
      expect(result).to eql(true)
    end
    it 'can check invalid pascal case' do
      all_cases.reject { |k, v| k == :pascal_case }.each do |k, v|
        result = LuckyCase.pascal_case?(v)
        expect(result).to eql(false), "Failed with '#{k}'"
      end
    end
    it 'can check valid camel case' do
      result = LuckyCase.camel_case?(all_cases[:camel_case])
      expect(result).to eql(true)
    end
    it 'can check invalid camel case' do
      all_cases.reject { |k, v| k == :camel_case }.each do |k, v|
        result = LuckyCase.camel_case?(v)
        expect(result).to eql(false), "Failed with '#{k}'"
      end
    end
    it 'can check valid dash case' do
      result = LuckyCase.dash_case?(all_cases[:dash_case])
      expect(result).to eql(true)
    end
    it 'can check invalid dash case' do
      all_cases.reject { |k, v| k == :dash_case }.each do |k, v|
        result = LuckyCase.dash_case?(v)
        expect(result).to eql(false), "Failed with '#{k}'"
      end
    end
    it 'can check valid upper dash case' do
      result = LuckyCase.upper_dash_case?(all_cases[:upper_dash_case])
      expect(result).to eql(true)
    end
    it 'can check invalid upper dash case' do
      all_cases.reject { |k, v| k == :upper_dash_case }.each do |k, v|
        result = LuckyCase.upper_dash_case?(v)
        expect(result).to eql(false), "Failed with '#{k}'"
      end
    end
    it 'can check valid train case' do
      result = LuckyCase.train_case?(all_cases[:train_case])
      expect(result).to eql(true)
    end
    it 'can check invalid train case' do
      all_cases.reject { |k, v| k == :train_case }.each do |k, v|
        result = LuckyCase.train_case?(v)
        expect(result).to eql(false), "Failed with '#{k}'"
      end
    end
    it 'can check valid word case' do
      result = LuckyCase.word_case?(all_cases[:word_case])
      expect(result).to eql(true)
    end
    it 'can check invalid word case' do
      all_cases.reject { |k, v| k == :word_case }.each do |k, v|
        result = LuckyCase.word_case?(v)
        expect(result).to eql(false), "Failed with '#{k}'"
      end
    end
    it 'can check valid upper word case' do
      result = LuckyCase.upper_word_case?(all_cases[:upper_word_case])
      expect(result).to eql(true)
    end
    it 'can check invalid upper word case' do
      all_cases.reject { |k, v| k == :upper_word_case }.each do |k, v|
        result = LuckyCase.upper_word_case?(v)
        expect(result).to eql(false), "Failed with '#{k}'"
      end
    end
    it 'can check valid capital word case' do
      result = LuckyCase.capital_word_case?(all_cases[:capital_word_case])
      expect(result).to eql(true)
    end
    it 'can check invalid capital word case' do
      all_cases.reject { |k, v| k == :capital_word_case }.each do |k, v|
        result = LuckyCase.capital_word_case?(v)
        expect(result).to eql(false), "Failed with '#{k}'"
      end
    end
    it 'can check valid sentence case' do
      result = LuckyCase.sentence_case?(all_cases[:sentence_case])
      expect(result).to eql(true)
    end
    it 'can check invalid sentence case' do
      all_cases.reject { |k, v| k == :sentence_case }.each do |k, v|
        result = LuckyCase.sentence_case?(v)
        expect(result).to eql(false), "Failed with '#{k}'"
      end
    end
    it 'can check valid mixed case' do
      result = LuckyCase.mixed_case?('mixed_Case-string')
      expect(result).to eql(true)
    end
    it 'can check invalid mixed case' do
      result = LuckyCase.mixed_case?('not_mixed/$§case_string')
      expect(result).to eql(false)
    end
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase do
  context 'snake case conversions: ' do
    it 'default into snake case' do
      conversion_examples = {
          'ExampleOne' => 'example_one',
          'exampleTwo' => 'example_two',
          'example-three' => 'example_three',
          'Example-Four' => 'example_four',
          'EXAMPLE-FIVE' => 'example_five',
          'EXAMPLE_SIX' => 'example_six',
          'example_Seven-extra' => 'example_seven_extra',
          'example_eight' => 'example_eight',
          '_example_underscoreOne' => '_example_underscore_one',
          '___example_underscoreTwo' => '___example_underscore_two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.snake_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :snake_case)
      end
    end
    it 'into snake case with preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => '_example_one',
          '_exampleTwo' => '_example_two',
          '____example-three' => '____example_three',
          '_Example-Four' => '_example_four',
          '__EXAMPLE-FIVE' => '__example_five',
          '___EXAMPLE_SIX' => '___example_six',
          '_____example_Seven-extra' => '_____example_seven_extra',
          '__example_eight' => '__example_eight',
          '_example_underscoreOne' => '_example_underscore_one',
          '___example_underscoreTwo' => '___example_underscore_two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.snake_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :snake_case)
      end
    end
    it 'into snake case without preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => 'example_one',
          '_exampleTwo' => 'example_two',
          '____example-three' => 'example_three',
          '_Example-Four' => 'example_four',
          '__EXAMPLE-FIVE' => 'example_five',
          '___EXAMPLE_SIX' => 'example_six',
          'example_Seven-extra' => 'example_seven_extra',
          '__example_eight' => 'example_eight',
          '_example_underscoreOne' => 'example_underscore_one',
          '___example_underscoreTwo' => 'example_underscore_two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.snake_case source, preserve_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :snake_case, preserve_prefixed_underscores: false)
      end
    end
  end

  context 'upper snake case conversions: ' do
    it 'default into upper snake case' do
      conversion_examples = {
          'ExampleOne' => 'EXAMPLE_ONE',
          'exampleTwo' => 'EXAMPLE_TWO',
          'example-three' => 'EXAMPLE_THREE',
          'Example-Four' => 'EXAMPLE_FOUR',
          'EXAMPLE-FIVE' => 'EXAMPLE_FIVE',
          'EXAMPLE_SIX' => 'EXAMPLE_SIX',
          'example_Seven-extra' => 'EXAMPLE_SEVEN_EXTRA',
          'example_eight' => 'EXAMPLE_EIGHT',
          '_example_underscoreOne' => '_EXAMPLE_UNDERSCORE_ONE',
          '___example_underscoreTwo' => '___EXAMPLE_UNDERSCORE_TWO',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.upper_snake_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :upper_snake_case)
      end
    end
    it 'into upper snake case with preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => '_EXAMPLE_ONE',
          '_exampleTwo' => '_EXAMPLE_TWO',
          '____example-three' => '____EXAMPLE_THREE',
          '_Example-Four' => '_EXAMPLE_FOUR',
          '__EXAMPLE-FIVE' => '__EXAMPLE_FIVE',
          '___EXAMPLE_SIX' => '___EXAMPLE_SIX',
          '_____example_Seven-extra' => '_____EXAMPLE_SEVEN_EXTRA',
          '__example_eight' => '__EXAMPLE_EIGHT',
          '_example_underscoreOne' => '_EXAMPLE_UNDERSCORE_ONE',
          '___example_underscoreTwo' => '___EXAMPLE_UNDERSCORE_TWO',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.upper_snake_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :upper_snake_case)
      end
    end
    it 'into upper snake case without preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => 'EXAMPLE_ONE',
          '_exampleTwo' => 'EXAMPLE_TWO',
          '____example-three' => 'EXAMPLE_THREE',
          '_Example-Four' => 'EXAMPLE_FOUR',
          '__EXAMPLE-FIVE' => 'EXAMPLE_FIVE',
          '___EXAMPLE_SIX' => 'EXAMPLE_SIX',
          'example_Seven-extra' => 'EXAMPLE_SEVEN_EXTRA',
          '__example_eight' => 'EXAMPLE_EIGHT',
          '_example_underscoreOne' => 'EXAMPLE_UNDERSCORE_ONE',
          '___example_underscoreTwo' => 'EXAMPLE_UNDERSCORE_TWO',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.upper_snake_case source, preserve_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :upper_snake_case, preserve_prefixed_underscores: false)
      end
    end
  end

  context 'pascal case conversions: ' do
    it 'default into pascal case' do
      conversion_examples = {
          'ExampleOne' => 'ExampleOne',
          'exampleTwo' => 'ExampleTwo',
          'example-three' => 'ExampleThree',
          'Example-Four' => 'ExampleFour',
          'EXAMPLE-FIVE' => 'ExampleFive',
          'EXAMPLE_SIX' => 'ExampleSix',
          'example_Seven-extra' => 'ExampleSevenExtra',
          'example_eight' => 'ExampleEight',
          '_example_underscoreOne' => '_ExampleUnderscoreOne',
          '___example_underscoreTwo' => '___ExampleUnderscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.pascal_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :pascal_case)
      end
    end
    it 'into pascal case with preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => '_ExampleOne',
          '_exampleTwo' => '_ExampleTwo',
          '____example-three' => '____ExampleThree',
          '_Example-Four' => '_ExampleFour',
          '__EXAMPLE-FIVE' => '__ExampleFive',
          '___EXAMPLE_SIX' => '___ExampleSix',
          '_____example_Seven-extra' => '_____ExampleSevenExtra',
          '__example_eight' => '__ExampleEight',
          '_example_underscoreOne' => '_ExampleUnderscoreOne',
          '___example_underscoreTwo' => '___ExampleUnderscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.pascal_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :pascal_case)
      end
    end
    it 'into pascal case without preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => 'ExampleOne',
          '_exampleTwo' => 'ExampleTwo',
          '____example-three' => 'ExampleThree',
          '_Example-Four' => 'ExampleFour',
          '__EXAMPLE-FIVE' => 'ExampleFive',
          '___EXAMPLE_SIX' => 'ExampleSix',
          'example_Seven-extra' => 'ExampleSevenExtra',
          '__example_eight' => 'ExampleEight',
          '_example_underscoreOne' => 'ExampleUnderscoreOne',
          '___example_underscoreTwo' => 'ExampleUnderscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.pascal_case source, preserve_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :pascal_case, preserve_prefixed_underscores: false)
      end
    end
  end

  context 'camel case conversions: ' do
    it 'default into camel case' do
      conversion_examples = {
          'ExampleOne' => 'exampleOne',
          'exampleTwo' => 'exampleTwo',
          'example-three' => 'exampleThree',
          'Example-Four' => 'exampleFour',
          'EXAMPLE-FIVE' => 'exampleFive',
          'EXAMPLE_SIX' => 'exampleSix',
          'example_Seven-extra' => 'exampleSevenExtra',
          'example_eight' => 'exampleEight',
          '_example_underscoreOne' => '_exampleUnderscoreOne',
          '___example_underscoreTwo' => '___exampleUnderscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.camel_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :camel_case)
      end
    end
    it 'into camel case with preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => '_exampleOne',
          '_exampleTwo' => '_exampleTwo',
          '____example-three' => '____exampleThree',
          '_Example-Four' => '_exampleFour',
          '__EXAMPLE-FIVE' => '__exampleFive',
          '___EXAMPLE_SIX' => '___exampleSix',
          '_____example_Seven-extra' => '_____exampleSevenExtra',
          '__example_eight' => '__exampleEight',
          '_example_underscoreOne' => '_exampleUnderscoreOne',
          '___example_underscoreTwo' => '___exampleUnderscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.camel_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :camel_case)
      end
    end
    it 'into camel case without preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => 'exampleOne',
          '_exampleTwo' => 'exampleTwo',
          '____example-three' => 'exampleThree',
          '_Example-Four' => 'exampleFour',
          '__EXAMPLE-FIVE' => 'exampleFive',
          '___EXAMPLE_SIX' => 'exampleSix',
          'example_Seven-extra' => 'exampleSevenExtra',
          '__example_eight' => 'exampleEight',
          '_example_underscoreOne' => 'exampleUnderscoreOne',
          '___example_underscoreTwo' => 'exampleUnderscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.camel_case source, preserve_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :camel_case, preserve_prefixed_underscores: false)
      end
    end
  end

  context 'dash case conversions: ' do
    it 'default into dash case' do
      conversion_examples = {
          'ExampleOne' => 'example-one',
          'exampleTwo' => 'example-two',
          'example-three' => 'example-three',
          'Example-Four' => 'example-four',
          'EXAMPLE-FIVE' => 'example-five',
          'EXAMPLE_SIX' => 'example-six',
          'example_Seven-extra' => 'example-seven-extra',
          'example_eight' => 'example-eight',
          '_example_underscoreOne' => '_example-underscore-one',
          '___example_underscoreTwo' => '___example-underscore-two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.dash_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :dash_case)
      end
    end
    it 'into dash case with preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => '_example-one',
          '_exampleTwo' => '_example-two',
          '____example-three' => '____example-three',
          '_Example-Four' => '_example-four',
          '__EXAMPLE-FIVE' => '__example-five',
          '___EXAMPLE_SIX' => '___example-six',
          '_____example_Seven-extra' => '_____example-seven-extra',
          '__example_eight' => '__example-eight',
          '_example_underscoreOne' => '_example-underscore-one',
          '___example_underscoreTwo' => '___example-underscore-two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.dash_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :dash_case)
      end
    end
    it 'into dash case without preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => 'example-one',
          '_exampleTwo' => 'example-two',
          '____example-three' => 'example-three',
          '_Example-Four' => 'example-four',
          '__EXAMPLE-FIVE' => 'example-five',
          '___EXAMPLE_SIX' => 'example-six',
          'example_Seven-extra' => 'example-seven-extra',
          '__example_eight' => 'example-eight',
          '_example_underscoreOne' => 'example-underscore-one',
          '___example_underscoreTwo' => 'example-underscore-two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.dash_case source, preserve_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :dash_case, preserve_prefixed_underscores: false)
      end
    end
  end

  context 'upper dash case conversions: ' do
    it 'default into upper dash case' do
      conversion_examples = {
          'ExampleOne' => 'EXAMPLE-ONE',
          'exampleTwo' => 'EXAMPLE-TWO',
          'example-three' => 'EXAMPLE-THREE',
          'Example-Four' => 'EXAMPLE-FOUR',
          'EXAMPLE-FIVE' => 'EXAMPLE-FIVE',
          'EXAMPLE_SIX' => 'EXAMPLE-SIX',
          'example_Seven-extra' => 'EXAMPLE-SEVEN-EXTRA',
          'example_eight' => 'EXAMPLE-EIGHT',
          '_example_underscoreOne' => '_EXAMPLE-UNDERSCORE-ONE',
          '___example_underscoreTwo' => '___EXAMPLE-UNDERSCORE-TWO',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.upper_dash_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :upper_dash_case)
      end
    end
    it 'into upper dash case with preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => '_EXAMPLE-ONE',
          '_exampleTwo' => '_EXAMPLE-TWO',
          '____example-three' => '____EXAMPLE-THREE',
          '_Example-Four' => '_EXAMPLE-FOUR',
          '__EXAMPLE-FIVE' => '__EXAMPLE-FIVE',
          '___EXAMPLE_SIX' => '___EXAMPLE-SIX',
          '_____example_Seven-extra' => '_____EXAMPLE-SEVEN-EXTRA',
          '__example_eight' => '__EXAMPLE-EIGHT',
          '_example_underscoreOne' => '_EXAMPLE-UNDERSCORE-ONE',
          '___example_underscoreTwo' => '___EXAMPLE-UNDERSCORE-TWO',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.upper_dash_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :upper_dash_case)
      end
    end
    it 'into upper dash case without preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => 'EXAMPLE-ONE',
          '_exampleTwo' => 'EXAMPLE-TWO',
          '____example-three' => 'EXAMPLE-THREE',
          '_Example-Four' => 'EXAMPLE-FOUR',
          '__EXAMPLE-FIVE' => 'EXAMPLE-FIVE',
          '___EXAMPLE_SIX' => 'EXAMPLE-SIX',
          'example_Seven-extra' => 'EXAMPLE-SEVEN-EXTRA',
          '__example_eight' => 'EXAMPLE-EIGHT',
          '_example_underscoreOne' => 'EXAMPLE-UNDERSCORE-ONE',
          '___example_underscoreTwo' => 'EXAMPLE-UNDERSCORE-TWO',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.upper_dash_case source, preserve_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :upper_dash_case, preserve_prefixed_underscores: false)
      end
    end
  end

  context 'train case conversions: ' do
    it 'default into train case' do
      conversion_examples = {
          'ExampleOne' => 'Example-One',
          'exampleTwo' => 'Example-Two',
          'example-three' => 'Example-Three',
          'Example-Four' => 'Example-Four',
          'EXAMPLE-FIVE' => 'Example-Five',
          'EXAMPLE_SIX' => 'Example-Six',
          'example_Seven-extra' => 'Example-Seven-Extra',
          'example_eight' => 'Example-Eight',
          '_example_underscoreOne' => '_Example-Underscore-One',
          '___example_underscoreTwo' => '___Example-Underscore-Two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.train_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :train_case)
      end
    end
    it 'into train case with preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => '_Example-One',
          '_exampleTwo' => '_Example-Two',
          '____example-three' => '____Example-Three',
          '_Example-Four' => '_Example-Four',
          '__EXAMPLE-FIVE' => '__Example-Five',
          '___EXAMPLE_SIX' => '___Example-Six',
          '_____example_Seven-extra' => '_____Example-Seven-Extra',
          '__example_eight' => '__Example-Eight',
          '_example_underscoreOne' => '_Example-Underscore-One',
          '___example_underscoreTwo' => '___Example-Underscore-Two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.train_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :train_case)
      end
    end
    it 'into train case without preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => 'Example-One',
          '_exampleTwo' => 'Example-Two',
          '____example-three' => 'Example-Three',
          '_Example-Four' => 'Example-Four',
          '__EXAMPLE-FIVE' => 'Example-Five',
          '___EXAMPLE_SIX' => 'Example-Six',
          'example_Seven-extra' => 'Example-Seven-Extra',
          '__example_eight' => 'Example-Eight',
          '_example_underscoreOne' => 'Example-Underscore-One',
          '___example_underscoreTwo' => 'Example-Underscore-Two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.train_case source, preserve_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :train_case, preserve_prefixed_underscores: false)
      end
    end
  end

  context 'word case conversions: ' do
    it 'default into word case' do
      conversion_examples = {
          'ExampleOne' => 'example one',
          'exampleTwo' => 'example two',
          'example-three' => 'example three',
          'Example-Four' => 'example four',
          'EXAMPLE-FIVE' => 'example five',
          'EXAMPLE_SIX' => 'example six',
          'example_Seven-extra' => 'example seven extra',
          'example_eight' => 'example eight',
          '_example_underscoreOne' => '_example underscore one',
          '___example_underscoreTwo' => '___example underscore two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.word_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :word_case)
      end
    end
    it 'into word case with preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => '_example one',
          '_exampleTwo' => '_example two',
          '____example-three' => '____example three',
          '_Example-Four' => '_example four',
          '__EXAMPLE-FIVE' => '__example five',
          '___EXAMPLE_SIX' => '___example six',
          '_____example_Seven-extra' => '_____example seven extra',
          '__example_eight' => '__example eight',
          '_example_underscoreOne' => '_example underscore one',
          '___example_underscoreTwo' => '___example underscore two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.word_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :word_case)
      end
    end
    it 'into word case without preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => 'example one',
          '_exampleTwo' => 'example two',
          '____example-three' => 'example three',
          '_Example-Four' => 'example four',
          '__EXAMPLE-FIVE' => 'example five',
          '___EXAMPLE_SIX' => 'example six',
          'example_Seven-extra' => 'example seven extra',
          '__example_eight' => 'example eight',
          '_example_underscoreOne' => 'example underscore one',
          '___example_underscoreTwo' => 'example underscore two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.word_case source, preserve_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :word_case, preserve_prefixed_underscores: false)
      end
    end
  end

  context 'upper word case conversions: ' do
    it 'default into upper word case' do
      conversion_examples = {
          'ExampleOne' => 'EXAMPLE ONE',
          'exampleTwo' => 'EXAMPLE TWO',
          'example-three' => 'EXAMPLE THREE',
          'Example-Four' => 'EXAMPLE FOUR',
          'EXAMPLE-FIVE' => 'EXAMPLE FIVE',
          'EXAMPLE_SIX' => 'EXAMPLE SIX',
          'example_Seven-extra' => 'EXAMPLE SEVEN EXTRA',
          'example_eight' => 'EXAMPLE EIGHT',
          '_example_underscoreOne' => '_EXAMPLE UNDERSCORE ONE',
          '___example_underscoreTwo' => '___EXAMPLE UNDERSCORE TWO',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.upper_word_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :upper_word_case)
      end
    end
    it 'into upper word case with preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => '_EXAMPLE ONE',
          '_exampleTwo' => '_EXAMPLE TWO',
          '____example-three' => '____EXAMPLE THREE',
          '_Example-Four' => '_EXAMPLE FOUR',
          '__EXAMPLE-FIVE' => '__EXAMPLE FIVE',
          '___EXAMPLE_SIX' => '___EXAMPLE SIX',
          '_____example_Seven-extra' => '_____EXAMPLE SEVEN EXTRA',
          '__example_eight' => '__EXAMPLE EIGHT',
          '_example_underscoreOne' => '_EXAMPLE UNDERSCORE ONE',
          '___example_underscoreTwo' => '___EXAMPLE UNDERSCORE TWO',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.upper_word_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :upper_word_case)
      end
    end
    it 'into upper word case without preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => 'EXAMPLE ONE',
          '_exampleTwo' => 'EXAMPLE TWO',
          '____example-three' => 'EXAMPLE THREE',
          '_Example-Four' => 'EXAMPLE FOUR',
          '__EXAMPLE-FIVE' => 'EXAMPLE FIVE',
          '___EXAMPLE_SIX' => 'EXAMPLE SIX',
          'example_Seven-extra' => 'EXAMPLE SEVEN EXTRA',
          '__example_eight' => 'EXAMPLE EIGHT',
          '_example_underscoreOne' => 'EXAMPLE UNDERSCORE ONE',
          '___example_underscoreTwo' => 'EXAMPLE UNDERSCORE TWO',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.upper_word_case source, preserve_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :upper_word_case, preserve_prefixed_underscores: false)
      end
    end
  end

  context 'capital word case conversions: ' do
    it 'default into capital word case' do
      conversion_examples = {
          'ExampleOne' => 'Example One',
          'exampleTwo' => 'Example Two',
          'example-three' => 'Example Three',
          'Example-Four' => 'Example Four',
          'EXAMPLE-FIVE' => 'Example Five',
          'EXAMPLE_SIX' => 'Example Six',
          'example_Seven-extra' => 'Example Seven Extra',
          'example_eight' => 'Example Eight',
          '_example_underscoreOne' => '_Example Underscore One',
          '___example_underscoreTwo' => '___Example Underscore Two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.capital_word_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :capital_word_case)
      end
    end
    it 'into capital word case with preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => '_Example One',
          '_exampleTwo' => '_Example Two',
          '____example-three' => '____Example Three',
          '_Example-Four' => '_Example Four',
          '__EXAMPLE-FIVE' => '__Example Five',
          '___EXAMPLE_SIX' => '___Example Six',
          '_____example_Seven-extra' => '_____Example Seven Extra',
          '__example_eight' => '__Example Eight',
          '_example_underscoreOne' => '_Example Underscore One',
          '___example_underscoreTwo' => '___Example Underscore Two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.capital_word_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :capital_word_case)
      end
    end
    it 'into capital word case without preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => 'Example One',
          '_exampleTwo' => 'Example Two',
          '____example-three' => 'Example Three',
          '_Example-Four' => 'Example Four',
          '__EXAMPLE-FIVE' => 'Example Five',
          '___EXAMPLE_SIX' => 'Example Six',
          'example_Seven-extra' => 'Example Seven Extra',
          '__example_eight' => 'Example Eight',
          '_example_underscoreOne' => 'Example Underscore One',
          '___example_underscoreTwo' => 'Example Underscore Two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.capital_word_case source, preserve_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :capital_word_case, preserve_prefixed_underscores: false)
      end
    end
  end

  context 'sentence case conversions: ' do
    it 'default into sentence case' do
      conversion_examples = {
          'ExampleOne' => 'Example one',
          'exampleTwo' => 'Example two',
          'example-three' => 'Example three',
          'Example-Four' => 'Example four',
          'EXAMPLE-FIVE' => 'Example five',
          'EXAMPLE_SIX' => 'Example six',
          'example_Seven-extra' => 'Example seven extra',
          'example_eight' => 'Example eight',
          '_example_underscoreOne' => '_Example underscore one',
          '___example_underscoreTwo' => '___Example underscore two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.sentence_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :sentence_case)
      end
    end
    it 'into sentence case with preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => '_Example one',
          '_exampleTwo' => '_Example two',
          '____example-three' => '____Example three',
          '_Example-Four' => '_Example four',
          '__EXAMPLE-FIVE' => '__Example five',
          '___EXAMPLE_SIX' => '___Example six',
          '_____example_Seven-extra' => '_____Example seven extra',
          '__example_eight' => '__Example eight',
          '_example_underscoreOne' => '_Example underscore one',
          '___example_underscoreTwo' => '___Example underscore two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.sentence_case source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :sentence_case)
      end
    end
    it 'into sentence case without preserving underscores' do
      conversion_examples = {
          '_ExampleOne' => 'Example one',
          '_exampleTwo' => 'Example two',
          '____example-three' => 'Example three',
          '_Example-Four' => 'Example four',
          '__EXAMPLE-FIVE' => 'Example five',
          '___EXAMPLE_SIX' => 'Example six',
          'example_Seven-extra' => 'Example seven extra',
          '__example_eight' => 'Example eight',
          '_example_underscoreOne' => 'Example underscore one',
          '___example_underscoreTwo' => 'Example underscore two',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.sentence_case source, preserve_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.convert_case source, :sentence_case, preserve_prefixed_underscores: false)
      end
    end
  end

  context 'capital conversions: ' do
    it 'default into capital' do
      conversion_examples = {
          'ExampleOne' => 'ExampleOne',
          'exampleTwo' => 'ExampleTwo',
          'example-three' => 'Example-three',
          'Example-Four' => 'Example-Four',
          'EXAMPLE-FIVE' => 'EXAMPLE-FIVE',
          'EXAMPLE_SIX' => 'EXAMPLE_SIX',
          'example_Seven-extra' => 'Example_Seven-extra',
          'example_eight' => 'Example_eight',
          '_example_underscoreOne' => '_example_underscoreOne',
          '___example_underscoreTwo' => '___example_underscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.capital source
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.capitalize(source))
      end
    end
    it 'into capital with skipping underscores' do
      conversion_examples = {
          'ExampleOne' => 'ExampleOne',
          'exampleTwo' => 'ExampleTwo',
          'example-three' => 'Example-three',
          'Example-Four' => 'Example-Four',
          'EXAMPLE-FIVE' => 'EXAMPLE-FIVE',
          'EXAMPLE_SIX' => 'EXAMPLE_SIX',
          'example_Seven-extra' => 'Example_Seven-extra',
          'example_eight' => 'Example_eight',
          '_example_underscoreOne' => '_Example_underscoreOne',
          '___example_underscoreTwo' => '___Example_underscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.capital source, skip_prefixed_underscores: true
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.capitalize(source, skip_prefixed_underscores: true))
      end
    end
    it 'into capital without explicitly skipping underscores' do
      conversion_examples = {
          '_ExampleOne' => '_ExampleOne',
          '_exampleTwo' => '_exampleTwo',
          '____example-three' => '____example-three',
          '_Example-Four' => '_Example-Four',
          '__EXAMPLE-FIVE' => '__EXAMPLE-FIVE',
          '___EXAMPLE_SIX' => '___EXAMPLE_SIX',
          'example_Seven-extra' => 'Example_Seven-extra',
          '__example_eight' => '__example_eight',
          '_example_underscoreOne' => '_example_underscoreOne',
          '___example_underscoreTwo' => '___example_underscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.capital source, skip_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
        expect(final_result).to eql(LuckyCase.capitalize(source, skip_prefixed_underscores: false))
      end
    end
  end

  context 'decapitalize conversions: ' do
    it 'default into lower first letter' do
      conversion_examples = {
          'ExampleOne' => 'exampleOne',
          'exampleTwo' => 'exampleTwo',
          'example-three' => 'example-three',
          'Example-Four' => 'example-Four',
          'EXAMPLE-FIVE' => 'eXAMPLE-FIVE',
          'EXAMPLE_SIX' => 'eXAMPLE_SIX',
          'example_Seven-extra' => 'example_Seven-extra',
          'example_eight' => 'example_eight',
          '_Example_underscoreOne' => '_Example_underscoreOne',
          '___Example_underscoreTwo' => '___Example_underscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.decapitalize source
        expect(final_result).to eql(expected_result)
      end
    end
    it 'into lower first letter with skipping underscores' do
      conversion_examples = {
          'ExampleOne' => 'exampleOne',
          'exampleTwo' => 'exampleTwo',
          'example-three' => 'example-three',
          'Example-Four' => 'example-Four',
          'EXAMPLE-FIVE' => 'eXAMPLE-FIVE',
          'EXAMPLE_SIX' => 'eXAMPLE_SIX',
          'example_Seven-extra' => 'example_Seven-extra',
          'example_eight' => 'example_eight',
          '_Example_underscoreOne' => '_example_underscoreOne',
          '___Example_underscoreTwo' => '___example_underscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.decapitalize source, skip_prefixed_underscores: true
        expect(final_result).to eql(expected_result)
      end
    end
    it 'into lower first letter without explicitly skipping underscores' do
      conversion_examples = {
          '_ExampleOne' => '_ExampleOne',
          '_exampleTwo' => '_exampleTwo',
          '____example-three' => '____example-three',
          '_Example-Four' => '_Example-Four',
          '__EXAMPLE-FIVE' => '__EXAMPLE-FIVE',
          '___eXAMPLE_SIX' => '___eXAMPLE_SIX',
          'Example_Seven-extra' => 'example_Seven-extra',
          '__Example_eight' => '__Example_eight',
          '_Example_underscoreOne' => '_Example_underscoreOne',
          '___Example_underscoreTwo' => '___Example_underscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        final_result = LuckyCase.decapitalize source, skip_prefixed_underscores: false
        expect(final_result).to eql(expected_result)
      end
    end
  end

  context 'mixed case conversions: ' do
    it 'default into mixed case' do
      conversion_examples = [
          'ExampleOne',
          'exampleTwo',
          'example-three',
          'Example-Four',
          'EXAMPLE-FIVE',
          'EXAMPLE_SIX',
          'example_Seven-extra',
          'example_eight',
          '_example_underscoreOne',
          '___example_underscoreTwo',
      ]
      conversion_examples.each do |source|
        final_result = LuckyCase.mixed_case source
        expect(final_result).not_to eql(source)
        expect(LuckyCase.mixed_case?(final_result)).to eql(true)
      end
    end
    it 'into mixed case with preserving underscores' do
      conversion_examples = [
          '_ExampleOne',
          '_exampleTwo',
          '____example-three',
          '_Example-Four',
          '__EXAMPLE-FIVE',
          '___EXAMPLE_SIX',
          '_____example_Seven-extra',
          '__example_eight',
          '_example_underscoreOne',
          '___example_underscoreTwo',
      ]
      conversion_examples.each do |source|
        final_result = LuckyCase.mixed_case source
        expect(final_result).not_to eql(source)
        expect(final_result[0]).to eql('_')
        expect(LuckyCase.mixed_case?(final_result)).to eql(true)
      end
    end
    it 'into mixed case without preserving underscores' do
      conversion_examples = [
          '_ExampleOne',
          '_exampleTwo',
          '____example-three',
          '_Example-Four',
          '__EXAMPLE-FIVE',
          '___EXAMPLE_SIX',
          'example_Seven-extra',
          '__example_eight',
          '_example_underscoreOne',
          '___example_underscoreTwo',
      ]
      conversion_examples.each do |source|
        final_result = LuckyCase.mixed_case source, preserve_prefixed_underscores: false
        expect(final_result).not_to eql(source)
        expect(final_result[0]).not_to eql('_')
        expect(LuckyCase.mixed_case?(final_result)).to eql(true)
      end
    end
  end

  context 'invalid conversions: ' do
    it 'into fantasia' do
      expect { LuckyCase.convert_case('snake_case', :fantasia_case) }.to raise_error(InvalidCaseError)
    end
  end

end

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase, '#cases' do
  context 'detect cases: ' do
    it 'detects several cases in lower case string' do
      r = LuckyCase.cases "lotofcases"
      expect(r).to match_array(%i[snake_case dash_case camel_case word_case])
    end
    it 'detects several cases in upper case string' do
      r = LuckyCase.cases "LOTOFCASES"
      expect(r).to match_array(%i[pascal_case upper_snake_case upper_dash_case upper_word_case])
    end
    it 'detects several cases in single word pascal case string' do
      r = LuckyCase.cases "Single"
      expect(r).to match_array(%i[pascal_case train_case sentence_case capital_word_case])
    end
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase, '#swap_case' do
  context 'swap cases: ' do
    it 'swaps different examples without preserving prefixed underscores' do
      conversion_examples = {
          'ExampleOne' => 'eXAMPLEoNE',
          'exampleTwo' => 'EXAMPLEtWO',
          'example-three' => 'EXAMPLE_THREE',
          'Example-Four' => 'eXAMPLE_fOUR',
          'EXAMPLE-FIVE' => 'example_five',
          'EXAMPLE_SIX' => 'example-six',
          'example_Seven-extra' => 'EXAMPLE-sEVEN_EXTRA',
          'example_eight' => 'EXAMPLE-EIGHT',
          '_example_underscoreOne' => '-EXAMPLE-UNDERSCOREoNE',
          '___example_underscoreTwo' => '---EXAMPLE-UNDERSCOREtWO',
      }
      conversion_examples.each do |source, expected_result|
        expect(LuckyCase.swap_case(source)).to eql(expected_result)
      end
    end
    it 'swaps different examples with preserving prefixed underscores' do
      conversion_examples = {
          '_ExampleOne' => '_eXAMPLEoNE',
          '_exampleTwo' => '_EXAMPLEtWO',
          '____example-three' => '____EXAMPLE_THREE',
          '_Example-Four' => '_eXAMPLE_fOUR',
          '__EXAMPLE-FIVE' => '__example_five',
          '___EXAMPLE_SIX' => '___example-six',
          'example_Seven-extra' => 'EXAMPLE-sEVEN_EXTRA',
          '__example_eight' => '__EXAMPLE-EIGHT',
          '_example_underscoreOne' => '_EXAMPLE-UNDERSCOREoNE',
          '___example_underscoreTwo' => '___EXAMPLE-UNDERSCOREtWO',
      }
      conversion_examples.each do |source, expected_result|
        expect(LuckyCase.swap_case(source, preserve_prefixed_underscores: true)).to eql(expected_result)
      end
    end
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase, '#constantize' do
  context 'constantize cases: ' do
    it 'constantizes several cases' do
      conversion_examples = {
          'ExampleOne' => 'ExampleOne',
          'exampleTwo' => 'ExampleTwo',
          'example-three' => 'ExampleThree',
          'Example-Four' => 'ExampleFour',
          'EXAMPLE-FIVE' => 'ExampleFive',
          'EXAMPLE_SIX' => 'ExampleSix',
          'example_Seven-extra' => 'ExampleSevenExtra',
          'example_eight' => 'ExampleEight',
          '_example_underscoreOne' => 'ExampleUnderscoreOne',
          '___example_underscoreTwo' => 'ExampleUnderscoreTwo',
      }
      conversion_examples.each do |source, expected_result|
        eval "module #{LuckyCase.pascal_case(expected_result, preserve_prefixed_underscores: false)} end"
        expect(LuckyCase.constantize(source)).to eql(Object.const_get(expected_result))
      end
    end
    it 'constantizes several cases with paths' do
      conversion_examples = {
          'example/one' => 'Example::One',
          'example::Two' => 'Example::Two',
          'example/three' => 'Example::Three',
          'ExampleFour' => 'ExampleFour',
          '/test/man' => 'Test::Man',
          'dummy/village/' => 'Dummy::Village',
          'example_Seven-extra' => 'ExampleSevenExtra',
          'example_eight' => 'ExampleEight',
          '_example_underscoreOne' => 'ExampleUnderscoreOne',
          '___example_underscoreTwo' => 'ExampleUnderscoreTwo',
          'much/more::longer/example' => 'Much::More::Longer::Example',
      }
      conversion_examples.each do |source, expected_result|
        er = if expected_result.include? '::'
               expected_result.split('::')
             else
               [expected_result]
             end
        curr_constant = ""
        er.each_with_index do |c, i|
          curr_constant += '::' unless curr_constant.empty?
          curr_constant += c
          eval "module #{curr_constant} end"
        end
        expect(LuckyCase.constantize(source)).to eql(Object.const_get(expected_result))
      end
    end
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase, '#deconstantize' do
  context 'deconstantize cases: ' do
    it 'deconstantizes to target path default' do
      conversion_examples = {
          'Example::One' => 'example/one',
          'Example::TrueMan::Show' => 'example/true_man/show',
          'ExampleWithMore::TrueMan::Show' => 'example_with_more/true_man/show',
      }
      conversion_examples.each do |source, expected_result|
        er = if source.include? '::'
               source.split('::')
             else
               [source]
             end
        curr_constant = ""
        er.each_with_index do |c, i|
          curr_constant += '::' unless curr_constant.empty?
          curr_constant += c
          eval "module #{curr_constant} end"
        end
        expect(LuckyCase.deconstantize(Object.const_get(source))).to eql(expected_result)
      end
    end
    it 'deconstantizes to target path train case' do
      conversion_examples = {
          'Example::One' => 'Example/One',
          'Example::TrueMan::Show' => 'Example/True-Man/Show',
          'ExampleWithMore::TrueMan::Show' => 'Example-With-More/True-Man/Show',
      }
      conversion_examples.each do |source, expected_result|
        er = if source.include? '::'
               source.split('::')
             else
               [source]
             end
        curr_constant = ""
        er.each_with_index do |c, i|
          curr_constant += '::' unless curr_constant.empty?
          curr_constant += c
          eval "module #{curr_constant} end"
        end
        expect(LuckyCase.deconstantize(Object.const_get(source), case_type: :train_case)).to eql(expected_result)
      end
    end
    it 'deconstantizes to target string default' do
      conversion_examples = {
          'Example::One' => 'Example::One',
          'Example::TrueMan::Show' => 'Example::TrueMan::Show',
          'ExampleWithMore::TrueMan::Show' => 'ExampleWithMore::TrueMan::Show',
      }
      conversion_examples.each do |source, expected_result|
        er = if source.include? '::'
               source.split('::')
             else
               [source]
             end
        curr_constant = ""
        er.each_with_index do |c, i|
          curr_constant += '::' unless curr_constant.empty?
          curr_constant += c
          eval "module #{curr_constant} end"
        end
        expect(LuckyCase.deconstantize(Object.const_get(source), target: :string)).to eql(expected_result)
      end
    end
    it 'deconstantizes to senseless target string snake case' do
      conversion_examples = {
          'Example::One' => 'example::one',
          'Example::TrueMan::Show' => 'example::true_man::show',
          'ExampleWithMore::TrueMan::Show' => 'example_with_more::true_man::show',
      }
      conversion_examples.each do |source, expected_result|
        er = if source.include? '::'
               source.split('::')
             else
               [source]
             end
        curr_constant = ""
        er.each_with_index do |c, i|
          curr_constant += '::' unless curr_constant.empty?
          curr_constant += c
          eval "module #{curr_constant} end"
        end
        expect(LuckyCase.deconstantize(Object.const_get(source), target: :string, case_type: :snake_case)).to eql(expected_result)
      end
    end
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase, '#valid_case_type?' do
  context 'check valid case types: ' do
    it "recognizes valid case type 'snake_case'" do
      expect(LuckyCase.valid_case_type?(:snake_case)).to eql(true)
    end
    it "recognizes valid case type 'upper_dash_case'" do
      expect(LuckyCase.valid_case_type?(:upper_dash_case)).to eql(true)
    end
    it "recognizes all defined case types" do
      LuckyCase::CASES.keys.each do |c|
        expect(LuckyCase.valid_case_type?(c)).to eql(true), "Unrecognized case type '#{c}'"
      end
    end
  end
  context 'check invalid case types: ' do
    it "does not recognize invalid case type 'apple_case'" do
      expect(LuckyCase.valid_case_type?(:apple_case)).to eql(false)
    end
    it "does not recognize invalid case type 'banana_case'" do
      expect(LuckyCase.valid_case_type?(:banana_case)).to eql(false)
    end
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe LuckyCase, '#valid_case_string?' do
  context 'check valid case strings: ' do
    it "recognizes valid case string 'snake_case'" do
      expect(LuckyCase.valid_case_string?('snake_case')).to eql(true)
    end
    it "recognizes valid case string 'UPPER-DASH-CASE'" do
      expect(LuckyCase.valid_case_string?('UPPER-DASH-CASE')).to eql(true)
    end
    it "recognizes valid case string 'word case string'" do
      expect(LuckyCase.valid_case_string?('word case string')).to eql(true)
    end
    it "recognizes valid case string 'some Mixed-case_string'" do
      expect(LuckyCase.valid_case_string?('some Mixed-case_string')).to eql(true)
    end
  end
  context 'check invalid case strings: ' do
    it "does not recognize invalid case string '4pple Cais'" do
      expect(LuckyCase.valid_case_string?('4pple Cais')).to eql(false)
    end
    it "does not recognize invalid case string '$pecial'" do
      expect(LuckyCase.valid_case_string?('$pecial')).to eql(false)
    end
    it "does not recognize invalid case string ')(§/$=)?'" do
      expect(LuckyCase.valid_case_string?(')(§/$=)?')).to eql(false)
    end
  end
end

#----------------------------------------------------------------------------------------------------
