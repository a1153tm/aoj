class String
  def to_ia
    split(/\s/).map {|s| s.to_i}
  end
end
  
def linear_search(subject, search)
  hash = {}
  subject.each do |k|
    hash[k] = true
  end
  ans = 0
  search.each do |s|
    if hash[s]
      ans += 1
    end
  end
  ans
end

STDIN.readline
subject = STDIN.readline.to_ia
STDIN.readline
search = STDIN.readline.to_ia

puts linear_search(subject, search)
