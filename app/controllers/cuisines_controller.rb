class CuisinesController < ApplicationController
  def list
    @cuisines = Cuisine.all

    render("cuisine_templates/list.html.erb")
  end

  def details
    @cuisine = Cuisine.where({ :id => params.fetch("id_to_display") }).first

    render("cuisine_templates/details.html.erb")
  end

  def blank_form
    @cuisine = Cuisine.new

    render("cuisine_templates/blank_form.html.erb")
  end

  def save_new_info
    @cuisine = Cuisine.new

    @cuisine.name = params.fetch("name")

    if @cuisine.valid?
      @cuisine.save

      redirect_to("/cuisines", { :notice => "Cuisine created successfully." })
    else
      render("cuisine_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @cuisine = Cuisine.where({ :id => params.fetch("id_to_prefill") }).first

    render("cuisine_templates/prefilled_form.html.erb")
  end

  def save_edits
    @cuisine = Cuisine.where({ :id => params.fetch("id_to_modify") }).first

    @cuisine.name = params.fetch("name")

    if @cuisine.valid?
      @cuisine.save

      redirect_to("/cuisines/" + @cuisine.id.to_s, { :notice => "Cuisine updated successfully." })
    else
      render("cuisine_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @cuisine = Cuisine.where({ :id => params.fetch("id_to_remove") }).first

    @cuisine.destroy

    redirect_to("/cuisines", { :notice => "Cuisine deleted successfully." })
  end
end
