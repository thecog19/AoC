def voteCounter(arr)
	finalHash = {}
	arr.each do |vote|
		results = vote.split("")
		results.each do |result|
			if !finalHash[result]
				finalHash[result] = 1
			else
				finalHash[result] += 1
			end
		end
	end
	puts finalHash
end



votestr = "BD,AE,CE,CE,AE,BE,AE,AE,AE,BE,CE,AD,CD,AE,AD,CE,BE,AE,CE,CE,CF,BE,CE,CE,BE,BE,AE,BD,AE,A,BE,BE,BD,BE,BE,CE,C,BE,CE,AD,AE,BD,CE,CD,CE,C"
voteCounter(votestr.split(","))