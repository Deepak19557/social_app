class MyJob < ApplicationJob
  queue_as :default
  # def perform(book)
  #   debugger
  #   @book = book
  #   book_name = @book.name
  #   Book.all.each do |book|
  #     if book.name == book_name
  #       @book.destroy
  #     end
  #   end
  # end

  def perform(*arg)
    Book.last.update(language: 'marathi')
  end
end
