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
  pair = [x,y,@unused[x][0],@unused[x][y]]
  @unused[x].delete_at(y)
  if @unused[x].length == 1
    @unused.delete_at(x)
  end
  pair
end

build_unused
puts @unused.length
puts pop_values


# Record answer

# Remove from matrix

# Random number



