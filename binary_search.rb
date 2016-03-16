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

  def binary_search_rec(val, left, right)
    return nil unless left < right
    mid = (left + right) / 2
    return mid if self[mid] == val
    if val < self[mid]
      binary_search_rec(val, left, mid)
    else
      binary_search_rec(val, mid+1, right)
    end
  end
end

STDIN.readline
subject = STDIN.readline.to_ia
STDIN.readline
search = STDIN.readline.to_ia

ans = 0
search.each do |v|
  #ans += 1 unless subject.binary_search(v).nil?
  ans += 1 unless subject.binary_search_rec(v, 0 , subject.size).nil?
end
puts ans
