class AuthorsController < ApplicationController

	def new
		@author = Author.new
	end

	def index
		@authors = Author.all
    # @authors = @authors.order(updated_at: :asc)
	end

  def create
    Author.create(name: params[:name], number: params[:number], email: params[:email])
    redirect_to authors_path
  end

	def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update(item_params)
    redirect_to authors_path
  end

  def delete_all_authors
  	Author.destroy_all
  	redirect_to authors_path
  end

  def author_delete
  	@author = Author.find(params[:id])
  	@author.destroy
  	respond_to :js
  	# respond_to do |format|
      # format.html { redirect_to ponies_url }
      # format.json { head :no_content }
      # format.js   { render :layout => false }
   	# end 
	end


  private

  def item_params
    params.require(:author).permit(:name, :number, :email)
  end

end
