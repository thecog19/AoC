class BlockBalancer
	def initialize(blockStr)
		@blocks = blockStr.split(" ").map(){|a| a.to_i}
		@counter = 0
		@visited = {}
		@loopMatch 
		mapState(@blocks)
		mainLoop
	end

	def mainLoop
		repeatedState = false
		while !repeatedState
			# puts @counter
			# print @blocks
			maxIndex = findHighestIndex(@blocks)
			@blocks = redistribute(maxIndex, @blocks)
			if(stateSeen?(@blocks))
				@loopMatch = @blocks.join("")
				repeatedState = true
			else
				mapState(@blocks)
			end
			@counter += 1
		end
		puts @counter
		findLoopSize
	end

	def findHighestIndex(arr)
		arr.index(arr.max)
	end

	def redistribute(maxIndex, arr)
		redistrubeNum = arr[maxIndex]
		arr[maxIndex] = 0
		while(redistrubeNum > 0)
			if(maxIndex >= arr.length - 1)
				maxIndex = 0
			else
				maxIndex += 1
			end
			arr[maxIndex] += 1
			redistrubeNum -= 1
		end
		arr
	end

	def stateSeen?(arr)
		key = arr.join("")
		@visited[key]
	end

	def mapState(arr)
		key = arr.join("")
		@visited[key] = true
	end

	def findLoopSize
		maxIndex = findHighestIndex(@blocks)
		@blocks = redistribute(maxIndex, @blocks)
		loopCounter = 1
		while @blocks.join("") != @loopMatch
			maxIndex = findHighestIndex(@blocks)
			@blocks = redistribute(maxIndex, @blocks)
			loopCounter += 1
		end
		puts loopCounter
	end
end
BlockBalancer.new("2 8 8 5 4 2 3 1 5 5 1 2 15 13 5 14")