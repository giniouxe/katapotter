require 'minitest/autorun'
require './potter'

class CalculatorTest < MiniTest::Test
  def test_no_book
    cart = Cart.new([])
    assert_equal(0, cart.total)
  end

  def test_one_book
    cart = Cart.new(["tome1"])
    assert_equal(8, cart.total)
  end

  def test_same_two_tomes
    cart = Cart.new(["tome1", "tome1"])
    assert_equal(16, cart.total)
  end

  def test_two_different_tomes
    cart = Cart.new(["tome1", "tome2"])
    assert_equal(16 * 0.95, cart.total)
  end

  def test_three_books_two_different_tomes
    cart = Cart.new(["tome1", "tome1", "tome2"])
    assert_equal(16*0.95 + 8, cart.total)
  end

  def test_four_books_three_different_tomes
    cart = Cart.new(["tome1", "tome1", "tome2", "tome3"])
    assert_equal(24*0.9 + 8, cart.total)
  end

  def test_five_books_three_different_tomes
    cart = Cart.new(["tome1", "tome1", "tome1", "tome2", "tome3"])
    assert_equal(24*0.9 + 16, cart.total)
  end

  def test_five_books_four_different_tomes
    cart = Cart.new(["tome1", "tome1", "tome2", "tome3", "tome4"])
    assert_equal(8*4*0.8 + 8, cart.total)
  end

  def test_ten_books_five_different_tomes
    cart = Cart.new(["tome1", "tome2", "tome3", "tome4", "tome5", "tome1", "tome2", "tome3", "tome4", "tome5"])
    assert_equal(8*10*0.75, cart.total)
  end

  def test_six_books_three_different_tomes
    cart = Cart.new(["tome1", "tome2", "tome3", "tome1", "tome2", "tome3"])
    assert_equal(8*6*0.9, cart.total)
  end

  def ten_books_five_different_tome_disorder
    cart = Cart.new(["tome5", "tome2", "tome3", "tome2", "tome1", "tome1", "tome4", "tome3", "tome4", "tome5"])
    assert_equal(8*6*0.9, cart.total)
  end

  def test_eleven_books_five_different_tomes
    cart = Cart.new(["tome1", "tome1", "tome2", "tome3", "tome4", "tome5", "tome1", "tome2", "tome3", "tome4", "tome5"])
    assert_equal(8*10*0.75 + 8, cart.total)
  end
end
