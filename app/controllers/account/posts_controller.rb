class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts.recent.paginate(:page => params[:page], :per_page => 5)
  end
end
