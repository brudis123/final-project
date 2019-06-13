class DishesController < ApplicationController
  def list
    @dishes = current_user.dishes
    #@restaurant_id = params.fetch("restaurant")

    render("dish_templates/list.html.erb")
  end

  def details
    @dish = Dish.where({ :id => params.fetch("id_to_display") }).first

    render("dish_templates/details.html.erb")
  end

  def blank_form
    @dish = Dish.new
    #@restaurant = Restaurant.new
    #@dish.photo = params.fetch(:photo)

    render("dish_templates/blank_form.html.erb")
  end

  def save_new_info
    @dish = Dish.new
    #@restaurant = Restaurant.new
    #@cuisine = Cuisine.new
    @dish.photo = params.fetch(:photo)
    @dish.user_id = current_user.id

    @dish.name = params.fetch("name")
    @dish.cuisine_id = params.fetch("cuisine_id")
    @dish.restaurant_id = params.fetch("restaurant_id")
    # @dish.comment = params.fetch("dish_comment")
    # @restaurant.address = params.fetch("address")
    
   

    if @dish.valid?
      @dish.save
      comment = Comment.new
      comment.user_id = current_user.id
      comment.dish_id = @dish.id
      comment.body = params.fetch("dish_comment")
      comment.save
    
      redirect_to("/dishes", { :notice => "Dish created successfully." })
    else
      render("dish_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @dish = Dish.where({ :id => params.fetch("id_to_prefill") }).first

    render("dish_templates/prefilled_form.html.erb")
  end

  def save_edits
    @dish = Dish.where({ :id => params.fetch("id_to_modify") }).first

    @dish.name = params.fetch("name")

    if @dish.valid?
      @dish.save

      redirect_to("/dishes/" + @dish.id.to_s, { :notice => "Dish updated successfully." })
    else
      render("dish_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @dish = Dish.where({ :id => params.fetch("id_to_remove") }).first

    @dish.destroy

    redirect_to("/dishes", { :notice => "Dish deleted successfully." })
  end
end
