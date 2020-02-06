# Find the first non-repeating character

@string = 'aabqbccddeffggpgjlskd;asdkf;aslkelkwwjefkalkdfndlksjf'
@a = {}
@answer = []

@string.chars.map {|a|
  @a.update({a => 1}) {|k, v1, v2| v1 + v2}
}

@a.each {|k, v|
  if @a.fetch(k) == 1
    @answer << k
  end
}

puts @answer[0]
