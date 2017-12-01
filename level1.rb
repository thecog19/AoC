def arrayTraverser(numString)
  arrayNum = numString.split('')
  x = 0
  sum = 0
  while(x < arrayNum.length)
    curr = arrayNum[x]
    nextNum = arrayNum[x + 1] || arrayNum[0]
    if(curr == nextNum)
      sum += curr.to_i
    end
    x += 1
  end
  puts sum
end


def arrayTraverserTwo(numString)
  arrayNum = numString.split('')
  x = 0
  sum = 0

  distance = arrayNum.length/2
  while(x < arrayNum.length)
    curr = arrayNum[x]
    nextNum = arrayNum[x + distance] || arrayNum[x - distance]
    if(curr == nextNum)
      sum += curr.to_i
    end
    x += 1
  end
  puts sum
end

# arrayTraverserTwo("1212")
