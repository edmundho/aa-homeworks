class BooksController < ApplicationController
  def index
    @books = Book.all
    # render :index
  end

  def new
    render :new
  end

  def create
    new_book = Book.new(book_params)
    new_book.save
    redirect_to books_url
    # solutions:
    # if new_book.save
    #   redirect_to books_url
    # else
    #   flash.now[:errors] = book.errors.full_messages
    #   render :new
    # end
  end

  def destroy
    book = Book.find_by(id: params[:id])
    # Book.delete(book.id)
    book.destroy
    redirect_to books_url
    # fail
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
