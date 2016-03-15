class List
  def initialize
    @array = []
  end

  def insert(val)
    @array << val
  end

  def delete(val)
    index = @array.find_index val
    @array.delete_at index if index
  end

  def delete_first
    @array.pop
  end

  def delete_last
    @array.shift
  end

  def to_s
    @array.reverse.join(' ')
  end
end

list = List.new

STDIN.read.split(/\n/)[1..-1].each do |line|
  ary = line.split(/\s/)
  case ary[0]
  when 'insert' then
    list.insert ary[1].to_i
  when 'delete' then
    list.delete ary[1].to_i
  when 'deleteFirst' then
    list.delete_first
  when 'deleteLast' then
    list.delete_last
  end
end
puts list.to_s
