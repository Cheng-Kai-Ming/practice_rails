class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def create
    @book = Book.new(clean_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end

  end

  def new
    @book = Book.new
  end
  
  def show
  end
  
  def edit
    @book = Book.find_by(id: params[:id])
  end
  
  def update
    @book = Book.find_by(id: params[:id])
    if @book.update(clean_params)
      redirect_to books_path
    else
      render :edit
    end
  end
  
  def destroy
   @book = Book.find_by(id: params[:id])
   if @book.destroy
    redirect_to books_path
   end

  end
  
  private
  def clean_params
    params.require(:book).permit(:name, :price)
  end
  
end
