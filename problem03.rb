require "prime"

def factorize(input) 

    primeFactors = []

	if Prime.prime?(input) || input == 1
		primeFactors[0,0] = input
		return primeFactors
	else
		Integer.each_prime(input-1) do |aPrime|
			if input % aPrime == 0
				primeFactors[0,0] = aPrime
				return primeFactors.concat(factorize(input / aPrime))
			end
		end
	end
end

begin
	inp = ARGV.first.to_i
	if n <= 0
		raise "Enter a non-zero positive number"
	end
	primeFactors = factorize(inp)
	printf("Largest prime factor for %d is %d\n", inp, primeFactors.last)
rescue StandardError
	printf("Unexpected exception occured finding largest prime factor! ")
	printf("Usage: ruby problem03.rb <number>\n")
end