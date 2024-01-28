module Enumerable
  def my_each_with_index
    index = -1

    my_each { |elem| yield(elem, index += 1) }
  end

  def my_select
    results = []

    my_each { |elem| results.push(elem) if yield elem }

    results
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for elem in self
      yield elem
    end
  end
end
