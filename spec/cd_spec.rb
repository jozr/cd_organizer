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

   	it 'returns albums by artist' do
      test_cd = Cd.new 'Kala', 'M.I.A.'
      test_cd.save
      test_cd_two = Cd.new 'Watch the Throne', 'Kanye West'
      test_cd_two.save
      test_cd_three = Cd.new 'Watch the Throne', 'Jay-Z'
      test_cd_three.save
      Cd.search_by_album('Watch the Throne').should eq ['Kanye West', 'Jay-Z']
    end

    it 'returns all unique artists in the cd collection' do
      test_cd_one = Cd.new 'Thriller', 'Michael Jackson'
      test_cd_one.save
      test_cd_two = Cd.new 'Black and White', 'Michael Jackson'
      test_cd_two.save
      test_cd_three = Cd.new 'Chronic', 'Dr. Dre'
      test_cd_three.save
      Cd.list_all_artists.should eq ['Dr. Dre', 'Michael Jackson']
    end
end