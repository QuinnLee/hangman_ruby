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

  def add_name(name)
    @names << name
    @names.map(&:downcase)
  end

  def check_name(name)
    true unless names.include?(name.downcase)
  end

end