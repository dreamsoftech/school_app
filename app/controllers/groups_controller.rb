class GroupsController < ApplicationController
before_filter :authenticate_user!

	def index
		@groups = Group.all
		if @groups.empty?
			flash.alert = "The Group data does not exist."
		end
	end

	def new
		@group = Group.new
	end	

	def create
		@group = Group.new(params[:group])
		
    if @group.save
      redirect_to(groups_path, notice: "The Group is successfully created.")
    else
      render :action => "new"
    end
	end

	def destroy
		Group.destroy(params[:id])
		redirect_to(groups_path, notice: "The Group is deleted successfully")
	end

	def edit
		@group = Group.find(params[:id])
	end

	def import_user(user_id)
		@user = User.find(user_id)
		@user.update_attributes({:group_id => '1'})
	end	

	def update
		group = Group.find_by_id(params[:id])
		if group.update_attributes(params[:group])
      redirect_to groups_path, :notice => "Group is successfully updated."
    else
      redirect_to group_path(group.id), :alert => "Unable to update the group information."
    end
	end	

end
