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
	n = ARGV[0].to_i
	if n <= 0
		raise "Enter a number greater than 0"
	end
	factors = (1..n).to_a().inject([]) do |facs, num| 
		facs << factorize(num) 
		facs
	end 
	all_factors = factors.flatten.uniq
	exp_hash = factors.inject({}) do |e_hash, f|
		count_hash = all_factors.inject({}) do |c_hash, factor|
			c_hash[factor] = f.count(factor) 
			c_hash
		end
		count_hash.each_pair do |k, v|
			if e_hash.has_key?(k)
				e_hash[k] = (e_hash[k] < v) ? v : e_hash[k]
			else
				e_hash[k] = v
			end
		end
		e_hash
	end

	multiple = exp_hash.inject(1) do |m, (k,v)|
		m = m * (k ** v)
		m
	end
	exp_hash.each_pair { |k,v| printf("%d^%d * ", k, v) }
	printf(" = %d\n", multiple);
rescue StandardError
	printf("Unexpected exception occured finding smallest multiple that is divisible by numbers 1..n!\n")
	printf("Usage: ruby problem05.rb <number>\n")
end
