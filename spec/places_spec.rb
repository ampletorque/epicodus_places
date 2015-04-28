require('rspec')
require('places')

describe(Places) do

  before() do
    Places.clear()
  end

  describe("#description") do
    it("lets you describe or state the place") do
      test_place = Places.new("Buenos Aires")
      expect(test_place.description()).to(eq("Buenos Aires"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Places.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a place to array of saved places") do
      test_place = Places.new("Berlin")
      test_place.save()
      expect(Places.all()).to(eq([test_place]))
    end
  end

  describe(".clear") do
    it("empties out all places") do
      Places.new("punk the penguin").save()
      Places.clear()
      expect(Places.all()).to(eq([]))
    end
  end
end
