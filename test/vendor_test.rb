require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/item"
require "./lib/vendor"


class VendorTest < Minitest::Test

  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
  end

  def test_it_has_attributes
    vendor = Vendor.new("Rocky Mountain Fresh")
    expected = {}
    assert_equal "Rocky Mountain Fresh", vendor.name
    assert_equal expected, vendor.inventory
  end

  def test_it_can_stock_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    vendor.stock(item1, 30)
    vendor.stock(item1, 25)
    vendor.check_stock(item1)

    assert_equal 55, vendor.check_stock(item1)
  end

  def test_it_can_return_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    vendor.stock(item1, 30)
    vendor.stock(item1, 25)
    vendor.stock(item2, 12)

    expected = {item1 => 55, item2 => 12}

    assert_equal expected, vendor.inventory
  end

end
