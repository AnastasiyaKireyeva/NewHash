class NewHash

  NUM_OF_STORAGES = 16

  def initialize
    @max_size = NUM_OF_STORAGES
    @max_density = 5
    @number_of_entries = 0
    @table = Array.new(@max_size) { [] }
  end

  def [](key)
    value = find_key(key).last 
  end

  def find_key(key)
    store_data(key).find { |entry| key == entry.first}
  end

  def []=(key, value)
    entry = find_key(key)
    if entry
       entry[1] = value
    else
      grow_the_table if full?
      store_data(key) << [key, value]
      @number_of_entries += 1
    end
  end

  def keys
    keys = []
    @table.flatten(1).select { |entry| keys << entry.first}
    keys
  end

  def values
    values = []
    @table.flatten(1).select { |entry| values << entry.last } 
    values
  end

  def length
    @table.flatten(1).length
  end

  def empty?
    @table.flatten(1).empty?
  end

  def clear
    @table.flatten(1).clear
  end

  def shift
    @table.flatten(1).shift
  end

  def inspect
    @table.flatten(1).to_s
  end

  def each_pair
    each_pair = []
    @table.flatten(1).select { |entry| each_pair << "#{entry[0]} is #{entry[1]}" }
    each_pair
  end

  def delete(key)
    position = index_of_key(key)
    index = @table[position].index { |entry| entry[0].eql?(key) }
    return @table[position].delete_at(index)[1] if index
  end

  private 

  def store_data(key)
    @table[index_of_key(key)]
  end

  def index_of_key(key)
    key.hash % @max_size
  end

  def full?
    @number_of_entries > @max_density * @max_size
  end

  def grow_the_table
    @max_size = @max_size << 1
    new_table = Array.new(@max_size) { [] }
    @table.flatten(1).each do |entry|
      new_table[index_of_key(entry.first)] << entry
    end
    @table = new_table
  end
end
 
h = NewHash.new

p h
p h.delete("one")