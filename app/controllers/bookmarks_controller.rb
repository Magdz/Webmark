class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [ :show]

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

  def All
    @bookmarks = Bookmark.all
    @arrays =[]
    @bookmarks.each do |bookmark|
      @arrays << User.find(bookmark.user_id).username
      @arrays << bookmark.title
      @arrays << bookmark.url
      @arrays << bookmark.description
      @arrays << Subcategory.find(bookmark.subcategory_id).title
      @arrays << Category.find(bookmark.category_id).title
    end
    respond_to do |format|
      format.json  { render :json => @arrays }
    end
  end

  def update_bookmarks

    @bookmarks = Subcategory.find(params[:subcategory_id]).bookmarks
    @arrays =[]
    @bookmarks.each do |bookmark|
      @arrays << User.find(bookmark.user_id).username
      @arrays << bookmark.title
      @arrays << bookmark.url
      @arrays << bookmark.description
      @arrays << Subcategory.find(bookmark.subcategory_id).title
      @arrays << Category.find(bookmark.category_id).title
    end
    respond_to do |format|
      format.json  { render :json => @arrays }
    end
  end

  def update_bookmarkkkks
    @bookmarks = User.find(params[:user_id]).bookmarks
    @arrays =[]
    @bookmarks.each do |bookmark|
      @arrays << User.find(bookmark.user_id).username
      @arrays << bookmark.title
      @arrays << bookmark.url
      @arrays << bookmark.description
      @arrays << Subcategory.find(bookmark.subcategory_id).title
      @arrays << Category.find(bookmark.category_id).title
    end
    respond_to do |format|
      format.json  { render :json => @arrays }
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
    Follower.all.each do |follower|
      if follower.followed_id == current_user.id 
        @notification = Notification.create(user_id: current_user.id , category_id: @bookmark.category_id , subcategory_id: @bookmark.subcategory_id , bookmark_id: @bookmark.id , recevier_id: follower.follower_id )
        @notification.save 
      end 
    end
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
    @notification = Notification.create(user_id: current_user.id , category_id: "0", subcategory_id: "0" , bookmark_id: "50000001" , recevier_id: @bookmark.user_id)
    @notification.save
    redirect_to :back
  end

  def downvote
    @bookmark = Bookmark.find(params[:id])
    @bookmark.downvote_by current_user
    @notification = Notification.create(user_id: current_user.id , category_id: "0", subcategory_id: "0" , bookmark_id: "50000000" , recevier_id: @bookmark.user_id )
    @notification.save
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
