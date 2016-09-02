require "minitest/autorun"
require "../../lib/chapter_3/have_no_side_effects"
require "ostruct"

class TestHaveNoSideEffects < Minitest::Test

  def setup
    @object = HaveNoSideEffects::UserValidator.new
  end

  def test_valid_password?
    assert_equal true, @object.valid_password?("toad", "secret")
  end

end
