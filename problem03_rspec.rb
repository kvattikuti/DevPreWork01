require_relative 'Problem03Module'

describe 'largest prime factor' do
	it 'finds 1 as largest prime factor for input of 1' do
		expect(Problem03Module.main([1])).to eq(1)
	end
	it 'finds 2 as largest prime factor for input of 2' do
		expect(Problem03Module.main([2])).to eq(2)
	end
	it 'finds 5 as largest prime factor for input of 100' do
		expect(Problem03Module.main([100])).to eq(5)
	end
	it 'mocks and stubs' do
		double('ClassX').class
		print instance_double("ClassX", :pages => 250).class.pretty_print_instance_variables
	end
end