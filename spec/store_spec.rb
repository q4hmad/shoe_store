require("spec_helper")

describe(Store) do
  it { should have_and_belong_to_many(:brands) }

  it("capitalizes the name") do
    store = Store.create({:name => "fuego"})
    expect(store.name()).to(eq("Fuego"))
  end
end
