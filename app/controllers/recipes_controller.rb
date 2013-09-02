class RecipesController < ApplicationController

  def recipe_index
  	@recipes = Recipe.all
  end

  def topdf
  	@recipe = Recipe.new
  end

  def preview
  	@recipe = Recipe.last
  end

  def create
  	if params[:create]
  		@recipe = Recipe.new(params[:recipe])
  		if @recipe.save
  			redirect_to preview_path			
  		else
  			render 'topdf'
  			# flash[:notice] = "A problem occurred. PANIC!"
  		end
  	elsif params[:reset]      
  		redirect_to topdf_path
  	end
	end

  # def save_to_pdf
  #   html = render_to_string(:action => '../pdf/my_template', :layout => false)
  #   pdf = PDFKit.new(html)
  #   send_data(pdf.to_pdf)
  # end

  def destroy
    if params[:recipe_ids].nil?
      flash[:error] = "No recipe/s selected."
      redirect_to recipe_index_path
    else
      @recipes = Recipe.find(params[:recipe_ids])
      @recipes.each do |recipe|
        recipe.destroy
      end
      #User.find(params[:user_id]).destroy
      # @user.destroy
      flash[:notice] = "Recipe(s) was/were successfully deleted."
      redirect_to recipe_index_path
    end
  end


end
