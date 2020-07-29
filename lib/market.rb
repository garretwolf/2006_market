class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.keys.include?(item)
    end
   end

   # def total_inventory
   #   inventory = Hash.new(0)
   #   @vendors.each do |vendor|
   #     vendor.inventory.each do |item, quantity|
   # end

  end
