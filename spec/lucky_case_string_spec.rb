require 'spec_helper'

RSpec.describe String do
  context 'Test Conversions' do
    it 'converts into several cases' do
      # require inside, to make not available in other tests but only here in this file
      require 'lucky_case/string'
      expect("TestCase".snake_case).to eql('test_case')
      expect("TestCase".upper_snake_case).to eql('TEST_CASE')
      expect("test_case".pascal_case).to eql('TestCase')
      expect("test-case".camel_case).to eql('testCase')
      expect("TestCaseMore".dash_case).to eql('test-case-more')
      expect("TestCaseMore".upper_dash_case).to eql('TEST-CASE-MORE')
      expect("TestCaseMore".train_case).to eql('Test-Case-More')
      expect("TestCaseMore".upper_case).to eql('TESTCASEMORE')
      expect("TestCaseMore".lower_case).to eql('testcasemore')
      expect("TestCaseMore".swap_case).to eql('tESTcASEmORE')
      expect("Test-Case-More".swap_case).to eql('tEST_cASE_mORE')
      expect("test_Case-More".swap_case).to eql('TEST-cASE_mORE')
      expect("some".capital).to eql('Some')
    end
    it 'converts! into several cases' do
      # require inside, to make not available only here in this file
      require 'lucky_case/string'
      s = "TestCase"; s.snake_case!
      expect(s).to eql('test_case')
      s = "TestCase"; s.upper_snake_case!
      expect(s).to eql('TEST_CASE')
      s = "test_case"; s.pascal_case!
      expect(s).to eql('TestCase')
      s = "test-case"; s.camel_case!
      expect(s).to eql('testCase')
      s = "TestCaseMore"; s.dash_case!
      expect(s).to eql('test-case-more')
      s = "TestCaseMore"; s.upper_dash_case!
      expect(s).to eql('TEST-CASE-MORE')
      s = "TestCaseMore"; s.train_case!
      expect(s).to eql('Test-Case-More')
      s = "TestCaseMore"; s.upper_case!
      expect(s).to eql('TESTCASEMORE')
      s = "TestCaseMore"; s.lower_case!
      expect(s).to eql('testcasemore')
      s = "some"; s.capital!
      expect(s).to eql('Some')
      s = "some"; s.capitalize!
      expect(s).to eql('Some')
      s = "swap_it"; s.swap_case!
      expect(s).to eql('SWAP-IT')
      s = "SwapMore-Than_Him"; s.swap_case!
      expect(s).to eql('sWAPmORE_tHAN-hIM')
    end
    it 'constantizes' do
      # require inside, to make not available only here in this file
      require 'lucky_case/string'
      TestCaseString = 'salami'
      expect("TestCaseString".constantize).to eql('salami')
      module TestCaseModule end
      module TestCaseModule::SubModule end
      expect("TestCaseModule::SubModule".constantize).to eql(TestCaseModule::SubModule)
    end
    it 'detects cases' do
      # require inside, to make not available only here in this file
      require 'lucky_case/string'
      expect('snake_case_string'.letter_case).to eql(:snake_case)
      expect('UPPER_SNAKE_CASE_STRING'.letter_case).to eql(:upper_snake_case)
      expect('PascalCaseString'.letter_case).to eql(:pascal_case)
      expect('camelCaseString'.letter_case).to eql(:camel_case)
      expect('dash-case-string'.letter_case).to eql(:dash_case)
      expect('UPPER-DASH-CASE-STRING'.letter_case).to eql(:upper_dash_case)
      expect('Train-Case-String'.letter_case).to eql(:train_case)
      expect('mixed_Case-string'.letter_case).to eql(:mixed_case)
      expect('mi%&/xed_Case-string'.letter_case).to eql(nil)
    end
    it 'checks cases' do
      # require inside, to make not available only here in this file
      require 'lucky_case/string'
      expect('snake_case_string'.snake_case?).to eql(true)
      expect('UPPER_SNAKE_CASE_STRING'.upper_snake_case?).to eql(true)
      expect('PascalCaseString'.pascal_case?).to eql(true)
      expect('camelCaseString'.camel_case?).to eql(true)
      expect('dash-case-string'.dash_case?).to eql(true)
      expect('UPPER-DASH-CASE-STRING'.upper_dash_case?).to eql(true)
      expect('Train-Case-String'.train_case?).to eql(true)
      expect('mixed_Case-string'.mixed_case?).to eql(true)
    end
  end
end

#----------------------------------------------------------------------------------------------------

RSpec.describe String, '#valid_case_string?' do
  context 'check valid case strings: ' do
    it "recognizes valid case string 'snake_case'" do
      expect('snake_case'.valid_case_string?).to eql(true)
    end
    it "recognizes valid case string 'UPPER-DASH-CASE'" do
      expect('UPPER-DASH-CASE'.valid_case_string?).to eql(true)
    end
    it "recognizes valid case string 'word case string'" do
      expect('word case string'.valid_case_string?).to eql(true)
    end
    it "recognizes valid case string 'some Mixed-case_string'" do
      expect('some Mixed-case_string'.valid_case_string?).to eql(true)
    end
  end
  context 'check invalid case strings: ' do
    it "does not recognize invalid case string '4pple Cais'" do
      expect('4pple Cais'.valid_case_string?).to eql(false)
    end
    it "does not recognize invalid case string '$pecial'" do
      expect('$pecial'.valid_case_string?).to eql(false)
    end
    it "does not recognize invalid case string ')(§/$=)?'" do
      expect(')(§/$=)?'.valid_case_string?).to eql(false)
    end
  end
end