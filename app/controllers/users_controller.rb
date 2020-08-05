class UsersController < ApplicationController

  def show
	@user = User.find(params[:id])
	@book = Book.new
	@books = Book.all
  end
  def index
  	@users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@book = Book.new #new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  	@user = current_user
  end

end
