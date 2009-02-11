require 'test/unit'

class AssertTest < Test::Unit::TestCase

  def test_assert_raise
    assert_raise(nil) {  }
  end
  
  def test_assert_nothing_raised
    assert_nothing_raised(nil) { raise "abc" }
  end
  
end
