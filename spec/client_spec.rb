require('spec_helper')

describe(Client) do
  describe('.all') do
    it('returns no clients in the list of clients') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('tells you the name of the client') do
      test_client = Client.new({:name => "Dennis Rodman", :stylist_id => 1, :id => nil})
      expect(test_client.name()).to(eq("Dennis Rodman"))
    end
  end

  describe('#save') do
    it('saves the clients') do
      test_client = Client.new({:name => "Dennis Rodman", :stylist_id => 1, :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#==') do
    it('is the same client if it has the same id and client') do
      test_client = Client.new({:name => "Dennis Rodman", :stylist_id => 1, :id => nil})
      test_client2 = Client.new({:name => "Dennis Rodman", :stylist_id => 1, :id => nil})
      expect(test_client).to(eq(test_client2))
    end
  end

  describe("#id") do
    it("sets its ID when you save") do
      test_client = Client.new({:name => "Dennis Rodman", :stylist_id => 1, :id => nil})
      test_client.save()
      expect(test_client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
    it("returns an client by their ID") do
      test_client = Client.new({:name => "Dennis Rodman", :stylist_id => 1, :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Ron Artest", :stylist_id => 1, :id => nil})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe("#update") do
    it("lets you update clients in the database") do
      test_client = Client.new({:name => "Bob the Builder", :stylist_id => 1, :id => nil})
      test_client.save()
      test_client.update({:name => "Ghostbuster", :stylist_id => 1, :id => nil})
      expect(test_client.name()).to(eq("Ghostbuster"))
    end
  end

  describe("#delete") do
    it("lets you delete a client from the database") do
      test_client = Client.new({:name => "Randy Savage", :stylist_id => 1, :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Katy Perry", :stylist_id => 1, :id => nil})
      test_client2.save()
      test_client.delete()
      expect(Client.all()).to(eq([test_client2]))
    end
  end
end
