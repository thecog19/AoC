class GarbageParser
  def initialize(garbage)
    @garbageStream = garbage.split("")
    @quoteQueue = []
    @inGarbage = false
    @negated = false
    @count = 0
    @garbageCount = 0
  end

  def parseStream
    @garbageStream.each do |char|
      parseChar(char)
    end
    puts "the bracket count is #{@count}"
    puts "the garbage count is #{@garbageCount}"
  end

  def parseChar(char)
    if(@negated)
      @negated = false
      return
    end

    if(char != "!" && @inGarbage && char != ">")
      @garbageCount += 1
    end

    if(char =="!")
      @negated = true
    elsif(char == ">" && @inGarbage)
      @inGarbage = false
    elsif(char =="<" && !@inGarbage)
      @inGarbage = true
    elsif(char == "{" && !@inGarbage)
      @quoteQueue.unshift("{")
    elsif(char == "}" && !@inGarbage)
      @count += @quoteQueue.length 
      @quoteQueue.shift
    end
  end

end
file = File.open("9/9.TXT", "rb")
contents = file.read

puts GarbageParser.new(contents).parseStream()