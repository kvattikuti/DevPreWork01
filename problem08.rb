# generate random series of 1000 digits
series_len = ARGV[0].to_i
series = (1..series_len).inject("") do |s, i| 
	s << (48 + Random.rand(10)).chr
	s
end

printf("Randomly generated series of %d digits is [ %s ]\n", series_len, series)

# find the sequence
digits = ARGV[1].to_i
i = 0
numseq = series.split(//).map { |i| i.to_i }
product_seq = greatest_product_seq = numseq[i...digits]
product = greatest_product = product_seq.inject(:*)

begin
	#printf("%d %d %s %d %d \n", i, i+digits, numseq[i...i+digits], product, greatest_product)	
	i = i+1

	product_seq = numseq[i...i+digits]
	product = product_seq.inject(:*)
	if product > greatest_product
		greatest_product = product
		greatest_product_seq = product_seq
	end
end while i < series.length-digits

printf("Largest product in the above series of %d consecutive digits is %s\n", digits, greatest_product_seq)

