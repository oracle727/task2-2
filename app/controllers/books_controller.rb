class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book)
    flash[:notice] = "You have created book successfully."
    else
    redirect_to books_path
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to books_path(current_user)
    end
  end

  def update
   @book= book.find(params[:id])
    flash[:notice] = "You have updated book successfully."
      if @book.update(book_params)
      redirect_to book_path (@book)
      else
      render:books_path
      end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end



  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
  
end
