class Cart
  def initialize(books)
    @books = books
    @reductions = [0, 0,
                   8*2 - 16*0.95,
                   8*3 - 24*0.9,
                   8*4 - 32*0.8,
                   8*5 - 40*0.75]
  end

  def total
    total = 0
    unit_price = 8
    total = unit_price * @books.length
    uniques = @books.uniq
    while @books.length > 0
      total -= @reductions[uniques.length]
      uniques.each do |unique|
        @books.slice!(@books.index(unique))
      end
      @books
      uniques = @books.uniq
    end
    total
  end
end
