#!/usr/bin/env ruby

@answers = Array.new(10) { Array.new(10) }
@unused = Array.new(9) { Array.new(10) }

# Build matrix
def build_unused
  9.times do |x|
    @unused[x][0] = x
    1.upto(9) do |y|
      @unused[x][y] = y
    end
  end
end

def pop_values
  x = rand(0..@unused.length-1)
  y = rand(1..@unused[x].length-1)
  #puts "x=#{x} y=#{y}"
  pair = [@unused[x][0]+2,@unused[x][y]+1]
  @unused[x].delete_at(y)
  if @unused[x].length == 1
    @unused.delete_at(x)
  end
  pair
end

build_unused
#puts @unused.length

num = 0
while @unused.length > 0
  x, y = pop_values
  puts "#{x} * #{y} = "
  #answer = gets.chomp.to_i
  answer = rand(1..100)
  @answers[x][y] = answer
  puts answer
  num = num+1
end

puts @answers.to_s



#puts pop_values


# Record answer

# Remove from matrix

# Random number



