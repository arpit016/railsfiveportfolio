class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :update]}, site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    if (logged_in?(:site_admin))
      if params[:category].blank?
        @blogs = Blog.recent.page(params[:page]).per(9)
      else
        if (params[:category] === "all")
          @blogs = Blog.recent.page(params[:page]).per(9)
        else
          @category = Category.find_by(name: params[:category])
          @blogs = @category.blogs.recent.page(params[:page]).per(9)
        end
        respond_to do |format|
          format.js
        end
      end
    else
      if params[:category].blank?
        @blogs = Blog.published.recent.page(params[:page]).per(9)
      else
        if (params[:category] === "all")
          @blogs = Blog.published.recent.page(params[:page]).per(9)
        else
          @category = Category.find_by(name: params[:category])
          @blogs = @category.blogs.published.recent.page(params[:page]).per(9)
        end
        respond_to do |format|
          format.js
        end
      end
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = current_user.blogs.build
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = current_user.blogs.build(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blogs_path, notice: 'Blog was successfully created.' }
      else
        format.html { render :new } 
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blogs_path, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    @blogs = Blog.all
    respond_to do |format|
      format.js
    end
  end
  
  def toggle_status
    if @blog.published?
      @blog.draft!
    elsif @blog.draft?
      @blog.published!
    end
    @blogs = Blog.all
    respond_to do |format|
      format.js 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :main_image, :thumb_image, :status, :article_part, category_ids: [])
    end
end
