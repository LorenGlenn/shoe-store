require('spec_helper')

describe(Store) do
  describe("#brands") do
    it("tells which brands are in this store") do
      test_store = Store.create({:name => "footlocker"})
      test_brand1 = Brand.create({:name => "nike", :description => "large brand"})
      test_brand2 = Brand.create({:name => "adidas", :description => "large brand"})
      test_store.brands.push(test_brand1, test_brand2)
      expect(test_store.brands()).to(eq([test_brand1, test_brand2]))
    end
  end
  it("converts the name to title case") do
    store = Store.create({:name => "footlocker"})
    expect(store.name()).to(eq("Footlocker"))
  end
end
