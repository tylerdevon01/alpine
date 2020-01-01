class GroupsController < ApplicationController
    def index
        @groups = current_user.groups.all
    end
    def show
        @group = Group.find_by(id:params[:id])
    end
    def new
        @group = current_user.groups.build
    end
    def create
        @group = current_user.groups.build(group_params)
        if @group.save
            redirect_to @group
        else
            render 'new'
        end
    end
    def edit
        @group = Group.find_by(id:params[:id])
    end
    def update
        @group = Group.find_by(id:params[:id])
        if @group.update(group_params)
            redirect_to @group
        else
            render 'edit'
        end
    end
    def destroy
        @group = Group.find_by(id: params[:id])
        @group.destroy
        redirect_to groups_url
    end
private
    def group_params
        params.require(:group).permit(:name, contact_ids:[])
    end
end
