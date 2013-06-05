class Books
  attr_accessor :title, :author, :page_count, :price

  @@book_count = 0
  @@page_count = 0

  def self.count
    @@book_count  
  end

  def self.pages
    @@page_count
  end

  def initialize(title, author, page_count, price)
    @title = title
    @author = author
    @page_count = page_count
    @price = price
    @@book_count += 1
    @@page_count += page_count
  end
end
