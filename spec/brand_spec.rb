require('spec_helper')

describe(Brand) do
  describe("#store") do
    it("tells which store the brand is in") do
      test_store = Store.create({:name => "footlocker"})
      test_brand = Brand.create({:name => "nike", :description => "large brand"})
      test_brand.stores.push(test_store)
      expect(test_brand.stores()).to(eq([test_store]))
    end
  end
    it("validates presence of description") do
      brand = Brand.new({:description => ""})
      expect(brand.save()).to(eq(false))
  end
    it("converts the name to title case") do
      brand = Brand.create({:name => "nike", :description => "large brand"})
      expect(brand.name()).to(eq("Nike"))
  end
end
