require 'pry'

arr = []
File.open('data.dat').each_line do |line|
  gsm, utf = line.split
  arr << utf.to_i(16) unless gsm.start_with?('#')
end

binding.pry
puts arr.sort
