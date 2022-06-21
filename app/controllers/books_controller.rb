class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_book, except: %i[index new create]

  def index
    authorize :book
    @books = Book.all
  end

  private
  def book_params
    params.require(:book).permit(:title, :discription, :price)
  end

  def find_book
    @book = current_user.books.find(params[:id])
  end
end