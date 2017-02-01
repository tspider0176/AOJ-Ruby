
def mulNext(list, n)
  # listについて隣り合うn個の積を求め返す関数
  (1..(list.length - n + 1)).map{|m|
    list[0..m]
  }
end


n, k = STDIN.gets.chomp.split(' ')

cs = (1..n.to_i).map{
  STDIN.gets
}.map(&:chomp).map(&:to_i)

# 2区切りの積の配列へ変換しc'を求める
cd = cs[0..-2].zip(cs[1..-1]).map{|f, x| f * x}.max

#
