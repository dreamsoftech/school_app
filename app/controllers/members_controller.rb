class MembersController < ApplicationController
  before_filter :authenticate_user!
  def create
    @group = Group.find_by_id! params[:group_identifier]
    @member = @group.members.new(params[:member])
    
    if @member.save
      redirect_to edit_group_path(params[:group_identifier]), notice: "The Member is successfully created."
    else
      redirect_to edit_group_path(params[:group_identifier]), :alert => "Unable to create the member."
    end
  end

  def update
    @group = Group.find_by_id! params[:group_identifier]
    @member = Member.find(params[:id])
    # @group = Group.find_by! id: params[:group_identifier]

    if @member.update_attributes(params[:member])
      redirect_to edit_group_path(params[:group_identifier]), :notice => "Member information is updated."
    else
      redirect_to edit_group_path(params[:group_identifier]), :alert => "Unable to update the member information."
    end
  end

  def index
    @members = Member.all
    @groups = Group.all
  end

  def destroy
    @member = Member.find(params[:id])
    @group = Group.find_by_id! @member.group_id unless @member.nil?
    @member.destroy

    redirect_to edit_group_path(@group), :notice => "Member is successfully deleted."

  end
end