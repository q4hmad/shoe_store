require("spec_helper")

describe(Store) do
  describe("#brands") do
    it("tells which brands are in it") do
      test_store = Store.create({:name => "shoes"})
      test_brand1 = Brand.create({:brand => "Manolo Blahnik", :store_id => store_id.id})
      test_brand2 = Brand.create({:brand => "Franco Sarto", :store_id => store_id.id})
     expect(test_store.brands()).to(eq([test_store1, test_store2]))
    end
  end
end
