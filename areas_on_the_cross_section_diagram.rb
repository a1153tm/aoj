def solve(diagram)
  area = 0
  froms = []
  layers = []
  (0...diagram.size).each do |x|
    c = diagram[x]
    case c
    when '\\' then
      froms.push x
    when '/' then
      next if froms.empty?
      from = froms.pop
      area += 1
      area += x - from - 1
      layers << [from, x]
    end
  end
  return area, layers
end

diagram = STDIN.readline
area, layers = solve(diagram)

puts area

area = 0
areas = []
last = diagram.size
layers.reverse.each do |layer|
  if last < layer[0]
    areas[-1] += (layer[1] - layer[0])
  else
    areas << layer[1] - layer[0]
    last = layer[0]
  end
end
puts "#{areas.size} #{areas.reverse.join(' ')}".strip
