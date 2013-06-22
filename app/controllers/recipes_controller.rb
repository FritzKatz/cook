class RecipesController < ApplicationController

  def index
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
  			render 'new'
  			flash[:notice] = "A problem occurred. PANIC!"
  		end
  	elsif params[:cancel]
  		redirect_to topdf_path
  	end
	end

  def save_to_pdf
    html = render_to_string(:action => '../pdf/my_template', :layout => false)
    pdf = PDFKit.new(html)
    send_data(pdf.to_pdf)
  end


end
