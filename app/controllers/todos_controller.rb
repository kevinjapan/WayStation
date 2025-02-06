class TodosController < ApplicationController

   allow_unauthenticated_access only: %i[ index show ]

   before_action :set_todo, only: %i[ show edit update ]

   def index
      @todos = Todo.all
   end

   def show
      # @todo is retrieved by set_todo
      @task = @todo.task
      @project = @task.project
      @comments = @todo.comments
   end

   def new
      @todo = Todo.new
      @task_id = params[:task_id]
   end

   def create
      @todo = Todo.new(todo_params)
      if @todo.save
        redirect_to @todo
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @task_id = params[:task_id]
    end
  
    def update

      @task_id = params[:task_id]
      
      if @todo.update(todo_params)
        redirect_to @todo
      else
         flash[:notice] = "The todo failed to update " + @todo.inspect
        render :edit, status: :unprocessable_entity
      end
    end
 
    def destroy
      @todo.destroy
      redirect_to todos_path
    end

    private
    
      def set_todo
         @todo = Todo.find(params[:id])
      end

      def todo_params
         params.expect(todo: [ :title, :task_id, :done_at])
      end


end
