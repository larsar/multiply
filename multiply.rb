#!/usr/bin/env ruby

require_relative './question_store'

store = QuestionStore.new(2, 5, 2, 5)

while store.num_unanswered > 0 do
  #xy = store.next_unanswered_question
  xy = store.random_unanswered_question
  x = xy[0]
  y = xy[1]

  puts "#{x} * #{y} = "
  answer = gets.chomp.to_i
  #   answer = x * y
  store.set_answer(x, y, answer)
end

puts 'Resultat'
puts '******'
store.all_keys.each do |key|
  q = store.get(key)
  x = key[0]
  y = key[1]
  result_string = q.correct_answer? ? 'Riktig' : 'Feil'
  puts "#{x} * #{y}: #{result_string}"
end
puts ''
puts "Antall spørsmål: #{store.num_total}"
puts "Antall riktige: #{store.num_correct} (#{(store.num_correct.to_f / store.num_total.to_f * 100).round(1)}%)"
puts "Antall feil: #{store.num_incorrect} (#{(store.num_incorrect.to_f / store.num_total.to_f * 100).round(1)}%)"




