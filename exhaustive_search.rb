class String
  def to_ia
    self.split(/\s/).map {|s| s.to_i}
  end
end

def create_memo(ary)
  memo = [Array.new(2001)] + ary.map {|i| Array.new(2001)}
  ary.each_with_index do |val, i|
    i += 1
    (1..2000).each do |j|
      res = false
      if val == j
        res = true
      elsif memo[i-1][j]
        res = true
      elsif j-val > 0 and memo[i-1][j-val]
        res = true
      end
      memo[i][j] = res
    end
  end
  memo
end

def solve(ary, dest)
  @memo ||= create_memo(ary)
  @memo.each do |row|
    return true if row[dest]
  end
  false
end

lines = STDIN.read.split(/\n/)
ary = lines[1].to_ia
lines[3].to_ia.each do |i|
  puts solve(ary, i) ? "yes" : "no"
end
