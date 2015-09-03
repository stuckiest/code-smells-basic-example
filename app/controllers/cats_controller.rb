class CatsController < ApplicationController
  def index
    @cat = Cat.all
    end
  end

  def show
    @cat = nil
    @cat = Cat.find(params[:id])
  end


  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      flash[:success] = "cat with id: #{params[:id]} updated"
      redirect_to cats_path
    else
      flash[:error] = "cat with id: #{params[:id]} not updated"
      render 'edit'
    end
  end

  def new
    binding.pry
    @cat = Cat.new
  end


  def create
    @cat = Cat.new(cat_params)
    if @cat && @cat.save
      success_message = "cat was successfully saved."
      flash[:success] = success_message
      redirect_to cats_path
    else
      error_message = "cat was not succesfully saved."
      flash[:error] = error_message
      render "new"
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
  end
  
  def destroy
    cat_id = params[:id]
    @cat = Cat.find(params[:id])
    if @cat
      if @cat.destroy
        flash[:success] = "cat destroyed"
      end
    end
    @cat.id
  end

  private
    def cat_params
      if params[:cat]
        params.require(:cat).permit(:name, :age, :fur_color, :eye_color, :food_type)
      end
    end
#end
