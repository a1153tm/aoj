def can_load?(k, bags, p)
  cnt = 1
  sum = 0
  bags.each do |b|
    if b > p
      return false
    elsif sum + b > p
      sum = b
      cnt += 1
    else
      sum += b
    end
    return false if cnt > k
  end
  true
end

def search(k, bags)
  left = 0
  right = bags.inject(0) {|sum, b| sum + b}
  while left < right
    mid = (left + right) / 2
    if can_load?(k, bags, mid)
      right = mid
    else
      left = mid + 1
    end
  end
  right
end

lines = STDIN.read.split(/\n/)
k = lines[0].split(/\s/)[1].to_i
bags = lines[1..-1].map {|l| l.to_i}
puts search(k, bags)
