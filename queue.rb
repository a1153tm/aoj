class MyProc
  attr_accessor :num, :time
  def initialize(num, time)
    @num = num 
    @time = time 
  end
end

def solve(procs, q)
  res = []
  time = 0
  loop do
    break if procs.empty?
    _proc = procs.shift
    if _proc.time > q
      _proc.time -= q
      time += q
      procs.push _proc
    else
      time += _proc.time
      res << "#{_proc.num} #{time}"
    end
  end
  res
end

lines = STDIN.read.split(/\n/)
q = lines[0].split(/\s/)[1].to_i
procs = lines[1..-1].map do |line|
  ary = line.split(/\s/)
  MyProc.new(ary[0], ary[1].to_i)
end

puts solve(procs, q).join("\n")
