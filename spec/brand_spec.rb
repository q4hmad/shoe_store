require("spec_helper")

  describe(Brand) do
    describe("#store") do
      it("tells which store it belongs to") do
        test_store = Store.create({:name => "Fuego"})
        test_brand = Brand.create({:brand => "Birkenstock", :store_id => store_id.id})
        expect(test_brand.store()).to(eq(test_store))
      end
    end
  end
