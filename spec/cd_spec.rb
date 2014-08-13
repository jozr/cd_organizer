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

	it 'returns albums by artist' do
      test_cd = Cd.new 'Ziggy Stardust', 'David Bowie'
      test_cd.save
      test_cd_two = Cd.new 'Devil Without a Cause', 'Kid Rock'
      test_cd_two.save
      test_cd_three = Cd.new 'The History of Rock', 'Kid Rock'
      test_cd_three.save
      Cd.search_by_artist('Kid Rock').should eq ['Devil Without a Cause', 'The History of Rock']
    end
end