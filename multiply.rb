#!/usr/bin/env ruby

X=3
Y=3

@answers = Array.new(X) { Array.new(Y) }
@unused = Array.new(X) { Array.new(Y+1) }

# Build matrix
def build_unused
  X.times do |x|
    @unused[x][0] = x
    1.upto(Y) do |y|
      @unused[x][y] = y
    end
  end
end

def pop_values
  x = rand(0..@unused.length-1)
  y = rand(1..@unused[x].length-1)
  puts "x=#{x} y=#{y}"
  pair = [@unused[x][0],@unused[x][y]]
  @unused[x].delete_at(y)
  if @unused[x].length == 1
    @unused.delete_at(x)
  end
  pair
end

build_unused
puts "UNUSED"
puts @unused.length

num = 0
while @unused.length > 0
  x, y = pop_values
  puts "#{x} * #{y} = "
  #answer = gets.chomp.to_i
  answer = x * y
  @answers[x][y] = answer
  puts answer
  num = num+1
end

puts num

def check_answers
  @answers.length.times do |x|
    @answers[x].length.times do |y|
      puts "#{x} * #{y} = #{@answers[x][y]}"
    end
  end
end


check_answers


#puts pop_values


# Record answer

# Remove from matrix

# Random number



