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

  def my_all?
    my_each { |elem| return false unless yield elem }

    true
  end

  def my_any?
    my_each { |elem| return true if yield elem }

    false
  end

  def my_none?
    my_each { |elem| return false if yield elem }

    true
  end

  def my_count
    return self.length unless block_given?

    count = 0

    my_each { |elem| count += 1 if yield elem }

    count
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
