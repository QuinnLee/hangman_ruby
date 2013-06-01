class Players
  include Enumerable
  attr_accessor :names

  def initialize
    @names = []
  end

  def each(&block)
    @names.each(&block)
  end

  def shuffle
    @names.shuffle!
  end

  def add_names(name)
    @names << name
  end
end