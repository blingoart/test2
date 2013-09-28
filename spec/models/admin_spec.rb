describe Admin do
  let(:admin) {FactoryGirl.create(:admin)}

  describe '.new' do
    it 'should be instantiated' do
      expect(admin).to_not be nil
    end
    it 'should be an instance of Admin' do
      expect(admin).to be_an_instance_of Admin
    end
  end

  describe '.create' do
    it 'should be saved to the db' do
      expect(admin.id).to_not be nil
    end
  end

  describe "#username" do
    it 'should have a username' do
      expect(admin.username).to_not be nil
      expect(admin.username).to be_an_instance_of String
      expect(admin.username).to eq 'admin'
    end
    it 'should have an email address' do
      expect(admin.email).to_not be nil
      expect(admin.email).to be_an_instance_of String
      expect(admin.email).to eq 'admin@admin.com'
    end
  end
end