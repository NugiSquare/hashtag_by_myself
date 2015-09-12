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
    
    def search
        #serching hashtag through post
        hs = params[:hashtag]
        
        @res1 = Hashtag.where("name = ?", hs)
        @res2 = Array.new
        @res1.each do |x|
            tmp = Post.where("id = ?", x.post_id)
            unless tmp.nil?
                @res2.push(tmp)
            end
        end
    end
end
