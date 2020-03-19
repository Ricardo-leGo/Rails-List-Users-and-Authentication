class ArticlesController < ApplicationController
    def index
        @newArr = []
        @articles = Article.all
        @articles.each do |art|
            if Article.find_by_email(art.contactuser)
                @newArr.push(Article.find_by_email(art.contactuser))
            end
        end
        puts @newArr.length 
    end
    def show
        @article = Article.find(params[:id])
    end
    def new
        @article = Article.new
    end
    def edit
        @article = Article.find(params[:id])
      end
       
    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    def update
    @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
    private
  def article_params
    params.require(:article).permit(:title, :nrz, :rfc, :email, :contactuser)
  end
    
end
