# LazyEnumerator provides a simple API to convert a list of
# Enumerables into a lazy Enumerator, e.g. provides items from
# the given enumerables on demand.
#
module LazyEnumerator
  def self.from(*enumerables)
    Enumerator.new do |enum|
      enumerables.each do |enumerable|
        enumerable.each do |item|
          enum.yield item
        end
      end
    end
  end
end

enumerator = LazyEnumerator.from([1,2,3], [:a, :b, :c])
enumerator.each do |item|
  puts ">>> #{item}"
end
