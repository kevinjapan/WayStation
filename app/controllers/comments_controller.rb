class CommentsController < ApplicationController
   
   before_action :set_comment, only: %i[ show edit update ]

   def index
   end

   def show
      # @comment is retrieved by set_comment
   end

   def new
      @comment = Comment.new
      @commentable_id = params[:commentable_id]
      @commentable_type =  params[:commentable_type]
   end

   def create
      @comment = Comment.new(comment_params)
      if @comment.save
         redirect_to @comment
      else
         render :new, status: :unprocessable_entity
      end
   end

   def edit
   end

   def update
   end

   def destroy
   end

   private

      def set_comment
         @comment = Comment.find(params[:id])
      end

      def comment_params
         params.require(:comment).permit(:title, :content, :commentable_id, :commentable_type)
      end

end
