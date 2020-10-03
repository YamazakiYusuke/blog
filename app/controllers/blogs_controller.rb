class BlogsController < ApplicationController
  before_action :set_db, only: [:show, :edit, :update, :destroy ]
  def index
    @blog = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def confirm
    @blog = Blog.new(blog_params)
  end
  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "ブログが作成されました"
      else
        render :new
      end
    end
  end
  def show
  end
  def edit

  end
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログが編集されました"
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path,notice: "ブログを削除しました"
  end

  private
  def set_db
    @blog = Blog.find(params[:id])
  end
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
