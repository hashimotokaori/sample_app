class ListsController < ApplicationController
  def new
    @list = List.new
  end
 
   def create
     #１.＆２.データーを受け取り新規登録するためのインスタンス作成
     list = List.new(list_params)
     #３、データをデーターベースに保存するためのsaaveメソッド実行
    list.save
     # フラッシュメッセージを定義し、詳細画面へリダイレクト
     flash[:notice] = "投稿が成功しました"
     redirect_to list_path(list.id)
   end
   
   def index
    @lists = List.all
   end
  
  

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
      list =List.find(params[:id])
      list.update(list_params)
      redirect_to list_path(list.id)
  end
  
  def destoroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end
   
   private
   #ストロングパラメータ
   def list_params
     params.require(:list).permit(:title, :body, :image)
   end
 end