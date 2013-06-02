class Players
  include Enumerable
  attr_reader :names

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
    @names.map(&:downcase)
  end

end