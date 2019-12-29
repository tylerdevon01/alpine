class ContactsController < ApplicationController
    def index
        @contacts = current_user.contacts.all
    end
    def show
        @contact = Contact.find_by(id: params[:id])
    end
    def new
        @contact = current_user.contacts.build
    end
    def create
        @contact = current_user.contacts.build(contact_params)
        if @contact.save
            redirect_to @contact
        else
            render 'new'
        end
    end
    def edit
    end
    def update
    end
    def destroy
    end

private
    def contact_params
        params.require(:contact).permit(:name, :email, :phone)
    end
end
