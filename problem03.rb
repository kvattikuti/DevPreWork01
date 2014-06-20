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

inp = ARGV.first.to_i
primeFactors = factorize(inp)
printf("Largest prime factor for %d is %d\n", inp, primeFactors.last)
