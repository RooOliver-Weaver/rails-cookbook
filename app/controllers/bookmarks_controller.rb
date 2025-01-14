class BookmarksController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @bookmark = Bookmark.new
  end

  def create
    @category = Category.find_by(id: params[:category_id])
    @bookmark = @category.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to category_path(@category), notice: "Bookmark successfully added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # raise
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to category_path, notice: "Bookmark successfully deleted"
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :recipe_id)
  end
end
