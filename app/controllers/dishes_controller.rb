class DishesController < ApplicationController
  def list
    @dishes = Dish.all

    render("dish_templates/list.html.erb")
  end

  def details
    @dish = Dish.where({ :id => params.fetch("id_to_display") }).first

    render("dish_templates/details.html.erb")
  end

  def blank_form
    @dish = Dish.new

    render("dish_templates/blank_form.html.erb")
  end

  def save_new_info
    @dish = Dish.new

    @dish.name = params.fetch("name")
    @dish.cuisine_id = params.fetch("cuisine_id")
    @dish.restaurant = params.fetch("restaurant_id")

    if @dish.valid?
      @dish.save

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
    @dish.cuisine_id = params.fetch("cuisine_id")
    @dish.restaurant = params.fetch("restaurant_id")

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
