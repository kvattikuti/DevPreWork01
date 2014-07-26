require "prime"

module Problem03Module

	def Problem03Module.factorize(input) 
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

	def Problem03Module.main(args)
		begin
			inp = args.first.to_i
			if inp <= 0
				raise "Enter a non-zero positive number"
			end
			primeFactors = factorize(inp)
			printf("Largest prime factor for %d is %d\n", inp, primeFactors.last)
			return primeFactors.last
		rescue StandardError
			printf("Unexpected exception occured finding largest prime factor! ")
			printf("Usage: ruby problem03.rb <number>\n")
			return nil
		end
	end
end