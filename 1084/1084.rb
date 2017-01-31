def mulNextWithIndex(list, k)
  (0..(list.length - k)).map{|m| [m, list[m..(m + k - 1)].inject(:*)]}.to_h
end

def maxValInHash(hash)
  hash.map{|k, v| v}.max
end

loop do
  n, k = STDIN.gets.chomp.split(' ').map(&:to_i)
  if n == 0 && k == 0 then break end
  
  cs = (1..n.to_i).map{
    STDIN.gets
  }.map(&:chomp).map(&:to_i)
  
  csd = mulNextWithIndex(cs, k)
  cd = maxValInHash(csd)

  max_index = csd.select{|k, v| v == cd}.to_a.flatten[0]
  max_arr = cs[max_index..(max_index+k-1)]
  max_arr.delete_at(max_arr.find_index(max_arr.min))
  ck = max_arr.push((cs - max_arr).max).inject(:*)  
  
  puts ck - cd < 0 ? "NO GAME" : (ck - cd)
end
