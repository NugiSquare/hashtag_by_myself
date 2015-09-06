class HomeController < ApplicationController
    def index
        @post = Post.all.reverse
        @hashtag = Hashtag.all
        @harray = Array.new
        @hashtag.each do |h|
            @harray.push(h.name)
        end
    end
    
    def create
        p = Post.new
        p.title = params[:title]
        p.context = params[:context]
        p.save
        
        redirect_to '/'
    end
    
    def update
        pid = params[:post_id]
        params[:name].split(" ").each do |x|
            h = Hashtag.new
            h.name = x
            h.post_id = pid
            h.save
        end
    
        redirect_to '/'
    end
    
    def delete
    end
end
