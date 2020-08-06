class BooksController < ApplicationController
  def index
  	@books = Book.all
    @book = Book.new
  end
  def show
  	@book = Book.find(params[:id])
    @user = @book.user_id
    @book1 = Book.new
  end
  def create
  	@book = Book.new(book_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
  	@book.user_id = current_user.id
    if @book.save #入力されたデータをdbに保存する。
  		redirect_to book_path(@book), notice: "successfully created book!"#保存された場合の移動先を指定。
  	else
  		@books = Book.all
  		render 'index'
  	end
  end
  def edit
    @book = Book.find(params[:id])
      unless @book.user_id == current_user.id
        redirect_to books_path
      end
  end
  private

  def book_params
  	params.require(:book).permit(:title,:body)
  end
end
