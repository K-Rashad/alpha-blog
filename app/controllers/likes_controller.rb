class LikesController < ApplicationController

    def update


       @article = Article.find(params[:id]);

    #    byebug
       if @article.likes
         likes = @article.likes + 1

       else
         likes =  1;
       end
       if @article.update(likes:likes)
        #  byebug
         respond_to do |format|
           format.js {render partial:'articles/like'}
         end
       end
    end

end