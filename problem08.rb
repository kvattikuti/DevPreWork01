# generate random series of 1000 digits
begin
	series_len = ARGV[0].to_i
	digits = ARGV[1].to_i
	if series_len <= 0 || digits <= 0 || digits > series_len
			raise "Enter a number greater than 0"
	end
	series = (1..series_len).inject("") do |s, i| 
		s << (48 + Random.rand(10)).chr
		s
	end

	printf("Randomly generated series of %d digits is [ %s ]\n", series_len, series)

	# find the sequence
	i = 0
	numseq = series.split(//).map { |i| i.to_i }
	
	product_seq = greatest_product_seq = numseq[i...digits]
	product = greatest_product = product_seq.inject(:*)

	while i < series.length-digits
		#printf("%d %d %s %d %d \n", i, i+digits, numseq[i...i+digits], product, greatest_product)	
		i = i+1

		product_seq = numseq[i...i+digits]
		product = product_seq.inject(:*)
		if product > greatest_product
			greatest_product = product
			greatest_product_seq = product_seq
		end
	end 

	printf("Largest product in the above series of %d consecutive digits is %s\n", digits, greatest_product_seq)

rescue StandardError
	printf("Unexpected exception occured finding largest product in X length series of Y consecutive digits\n")
	printf("Usage: ruby problem08.rb <series_length> <consecutive_digits_count>\n")

end
