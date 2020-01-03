class NotesController < ApplicationController
before_action :get_contact

def index
  @notes = @contact.notes.all
end

def new
  @note = @contact.notes.build
end

def create
  @note = @contact.notes.build(note_params)
  if @note.save
    redirect_to [@contact, @note]
  else
    render 'new'
  end
end

def show
  @note = @contact.notes.find_by(id:params[:id])
end

def edit
  @note = Note.find_by(id: params[:id])
end

def update
  @note = Note.find_by(id: params[:id])
  if @note.update(note_params)
    redirect_to [@contact, @note]
  else
    render 'edit'
  end
end

def destroy
  @note = Note.find_by(id: params[:id])
  @note.destroy
  redirect_to contact_notes_path
end

protected

def get_contact
  @contact = Contact.find_by(id: params[:contact_id])
end

private
  def note_params
    params.require(:note).permit(:name, :body)
  end
end
