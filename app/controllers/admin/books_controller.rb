class Admin::BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :find_book, except: %i[index new create]

  def index
    authorize :book
    @books = Book.all
  end
  
  def new
    authorize :book
    @book = current_user.books.new
  end
  
  def create
    authorize :book
    @book = current_user.books.new(book_params)

    if @book.save
      redirect_to admin_books_path, notice: "新增成功"
    else
      render :new
    end
  end
  
  def edit
    authorize :book
  end
  
  def update
    authorize :book
    if @book.update(book_params)
      redirect_to admin_books_path, notice: "修改成功"
    else
      render :edit
    end
  end
  
  def destroy
    authorize :book
    @book.destroy
    redirect_to admin_books_path, notice: "刪除成功"
  end

  private
  def book_params
    params.require(:book).permit(:title, :discription, :price)
  end

  def find_book
    @book = current_user.books.find(params[:id])
  end
end