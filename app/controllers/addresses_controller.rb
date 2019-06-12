class AddressesController < ApplicationController
  def list
    @addresses = Address.all

    render("address_templates/list.html.erb")
  end

  def details
    @address = Address.where({ :id => params.fetch("id_to_display") }).first

    render("address_templates/details.html.erb")
  end

  def blank_form
    @address = Address.new

    render("address_templates/blank_form.html.erb")
  end

  def save_new_info
    @address = Address.new


    if @address.valid?
      @address.save

      redirect_to("/addresses", { :notice => "Address created successfully." })
    else
      render("address_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @address = Address.where({ :id => params.fetch("id_to_prefill") }).first

    render("address_templates/prefilled_form.html.erb")
  end

  def save_edits
    @address = Address.where({ :id => params.fetch("id_to_modify") }).first


    if @address.valid?
      @address.save

      redirect_to("/addresses/" + @address.id.to_s, { :notice => "Address updated successfully." })
    else
      render("address_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @address = Address.where({ :id => params.fetch("id_to_remove") }).first

    @address.destroy

    redirect_to("/addresses", { :notice => "Address deleted successfully." })
  end
end
