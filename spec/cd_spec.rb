require 'rspec'
require 'cd'

describe Cd do
	it 'is initialized with an album and artist name' do
		test_cd = Cd.new 'In Utero', 'Nirvana'
		test_cd.should be_a Cd
	end
end