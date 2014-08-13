require 'rspec'
require 'cd'

describe Cd do
	before do
		Cd.clear
	end

	it 'is initialized with an album and artist name' do
		test_cd = Cd.new 'In Utero', 'Nirvana'
		test_cd.should be_a Cd
	end

	it 'allows you to add multiple cds' do
		test_cd = Cd.new 'Universal Mother', "Sinead O'Connor"
		test_cd.save
		test_cd_two = Cd.new 'In Utero', 'Nirvana'
		test_cd_two.save
		Cd.all.should eq [test_cd, test_cd_two]
	end

	it 'clears all contacts' do
		Cd.clear.should eq []
	end
end