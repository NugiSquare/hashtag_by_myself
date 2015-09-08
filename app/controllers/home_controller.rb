class HomeController < ApplicationController
    
    def index
        #posts
        @post = Post.all.reverse
        #hashtags typed
        @hashtag = Hashtag.all
        #hashtag array in string
        @harray = Array.new
        @hashtag.each do |h|
            @harray.push(h.name)
        end
    end
    
    def create
        #creating post
        p = Post.new
        p.title = params[:title]
        p.context = params[:context]
        p.save
        
        redirect_to '/'
    end
    
    def update
        #creating hashtag
        pid = params[:post_id]
        params[:name].split(" ").compact.each do |x|
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
