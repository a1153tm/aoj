lass String
  def to_ia
    self.split(/\s+/).map {|s| s.to_i}
  end
end
  
class Array
  def rsort
    self.sort {|a, b| b <=> a}
  end
 
  def swap(i, j)
    t = self[i]
    self[i] = self[j]
    self[j] = t
  end
end
 
def bubble_sort(ary)
  n = ary.size
  flag = true
  while flag
    flag = false
    (1...n).to_a.rsort.each do |i|
      if ary[i][1].to_i < ary[i-1][1].to_i
        ary.swap(i, i-1)
        flag = true
      end
    end
  end
end
  
def selection_sort(ary)
  n = ary.size
  (0...n).each do |i|
    min = i
    (i...n).each do |j|
      if ary[j][1].to_i < ary[min][1].to_i
        min = j
      end
    end
    ary.swap(i, min) unless i == min
  end
end
  
STDIN.readline
line = STDIN.readline
 
ary_b = line.split(/\s/)
bubble_sort ary_b
puts ary_b.join(" ")
puts "Stable"
 
ary_s = line.split(/\s/)
selection_sort ary_s
puts ary_s.join(" ")
puts ary_s == ary_b ? "Stable" : "Not stable"
