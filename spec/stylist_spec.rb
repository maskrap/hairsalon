require('spec_helper')

describe(Stylist) do
  describe('.all') do
    it('returns no stylists in the list of stylists') do
      expect(Stylist.all()).to(eq([]))
    end
  end
end
