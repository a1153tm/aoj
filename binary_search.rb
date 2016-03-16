class String
  def to_ia
    split(/\s/).map {|s| s.to_i}
  end
end
  
class Array
  def binary_search(val)
    left = 0
    right = size
    while left < right
      mid = (left + right) / 2
      if self[mid] == val
        return val
        #return mid
      elsif val < self[mid]
        right = mid
      else
        left = mid + 1
      end
    end
    nil
  end
end

STDIN.readline
subject = STDIN.readline.to_ia
STDIN.readline
search = STDIN.readline.to_ia

ans = 0
search.each do |v|
  ans += 1 unless subject.binary_search(v).nil?
end
puts ans
