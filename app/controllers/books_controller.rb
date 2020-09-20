class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_book, only:[:edit, :update]

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @book_comments = BookComment.all
  end

  def index
    @books = Book.all
    @book = Book.new
    @book_comment = BookComment.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      @books = Book.all
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:user_id ,:title ,:body)
  end
  def ensure_correct_book
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
    redirect_to books_path
    end
  end

end
