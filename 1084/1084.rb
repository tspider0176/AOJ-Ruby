# http://yuroyoro.hatenablog.com/entry/2012/08/09/203959
module ComposableFunction
  def compose(g)
    lambda{|*args| self.to_proc.call(g.to_proc.call(*args)) }
  end

  def >>(g)
    g << self
  end

  def self.included(klass)
    klass.send(:alias_method, :<<, :compose)
  end
end

[Proc, Method, Symbol].each do |klass|
  klass.send(:include, ComposableFunction)
end

n, k = STDIN.gets.chomp.split(' ')

f = :chomp.to_proc
g = :to_i.to_proc
h = f >> g

cs = (1..n.to_i).map{
  STDIN.gets
}.map(&h)

p cs

# k区切りの席の配列へ変換
