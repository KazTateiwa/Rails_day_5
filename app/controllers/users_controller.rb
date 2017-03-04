class UsersController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def contact
    @contact = Contact.new
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.address = params[:address]
   if @contact.save
    #  session saves the contact information and allows us to use the ID by calling contact_id, calling it @contact.id lets you use it in the contact_info.html.erb
     session[:contact_id] = @contact.id
    # redirect_to will send us to the new page to show us our stored contact
     redirect_to '/contact_info'
   end
  end

  def edit
    # @contact = Contact.find(...)  get your Contact from the database by their ID, maybe use a sesson?
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.address = params[:address]
    if
      # TODO: if the Contact retrieved from the database is different from any of the params the user entered...
      @contact.save
      # TODO: Send the user to the index, the Contact.all will show them the successful edit
    end
  end

  def update_info

  end

  # contact_info method was made to allow us to create another view (contact_info.html.erb)
  def contact_info
    # this will be used to find the contact id and pull it from the session
    @contact = Contact.find(session[:contact_id])
  end


end
