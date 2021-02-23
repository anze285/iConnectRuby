class DiscoveriesController < ApplicationController
  before_action :authenticate_user!
  
    def index
    @posts = Post.all.order("RANDOM()").limit(5)
    end

end
