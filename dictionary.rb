module AOJ
  class Hash
    def initialize
      @size = 1000000
      #@conv = {'A' => '1', 'C' => '2', 'G' => '3', 'T' => '4'}
      @array = Array.new(@size)
    end

    def insert(value)
      key = to_key(value)
      at(key) << value
    end

    def find(value)
      key = to_key(value)
      at(key).each do |v|
        return true if v == value
      end
      false
    end

    private

    def at(key)
      @array[key] = [] unless @array[key]
      @array[key]
    end

    def to_key(raw_value)
      #digits = @conv.keys.inject(raw_value) do |str, c|
      #  str.gsub(/#{c}/, @conv[c])
      #end
      #"#{'0' * (12-digits.size)}#{digits}".to_i % @size
      (raw_value.hash % @size).abs
    end
  end
end

hash = AOJ::Hash.new

STDIN.read.split(/\n/)[1..-1].each do |line|
  ary = line.split(/\s/)
  command = ary[0]
  value = ary[1]
  if command == 'insert'
    hash.insert value
  else
    puts hash.find(value) ? "yes" : "no"
  end
end
