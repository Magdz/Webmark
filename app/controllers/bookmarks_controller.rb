class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @bookmarks = Bookmark.all
    respond_with(@bookmarks)
  end

  def show
    respond_with(@bookmark)
  end

  def new
    @bookmark = current_user.bookmarks.build
    respond_with(@bookmark)
  end

  def find
    @bookmarks = Subcategory.find(params[:subcategory_id]).bookmarks;
    respond_to do |format|
      format.json  { render :json => @bookmarks }
    end
  end

  def update_subcategories
    @subcategories = Category.find(params[:category_id]).subcategories
    respond_to do |format|
      format.json  { render :json => @subcategories }
    end
  end

  def edit
  end

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    @bookmark.save
    respond_with(@bookmark)
  end

  def update
    @bookmark.update(bookmark_params)
    respond_with(@bookmark)
  end

  def destroy
    if current_user.id == 1 || current_user.id == @bookmark.user_id
       @bookmark.destroy
       respond_with(@bookmark)
    end
  end

  def upvote
    @bookmark = Bookmark.find(params[:id])
    @bookmark.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @bookmark = Bookmark.find(params[:id])
    @bookmark.downvote_by current_user
    redirect_to :back
  end

  private
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def bookmark_params
      params.require(:bookmark).permit(:title, :url, :description, :category_id, :subcategory_id , :user_id, :image)
    end
end
