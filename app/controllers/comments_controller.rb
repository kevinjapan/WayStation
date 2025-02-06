class CommentsController < ApplicationController
   
   before_action :set_comment, only: %i[ show edit update ]

   def index
      
      @comments = Comment.all

      # to do : can we inc. link to commentable parent?
      # @augmented_comments = []
      # the_augmented_comments = []

      # create list augmented w/ project.title
      # @comments.each do |comment|
      #    my_programme = Programme.find(comment.programme_id)
      #    augmented_comment = [comment,my_programme]
      #    the_augmented_comments.push(augmented_comment)
      # end


      # sort by comment and project title
      # @augmented_comments = the_augmented_comments.sort_by { |comment, programme| [programme.title, project.title] }
      @augmented_comments = @comments.sort_by{ |comment| [comment.title] }

   end

   def show
      # @comment is retrieved by set_comment
   end

   def new
      @comment = Comment.new
      @commentable_id = params[:commentable_id]
      @commentable_type =  params[:commentable_type]

      # let's pass the ActionRecord (of type 'commentable_type') we are adding the comment to
      type = @commentable_type
      @commentable = type.constantize.find(@commentable_id)
   end

   def create
      @comment = Comment.new(comment_params)
      if @comment.save
         redirect_to @comment.commentable
      else
         flash[:notice] = "The comment was not created " + @comment.inspect
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
