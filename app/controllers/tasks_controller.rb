class TasksController < ApplicationController

   allow_unauthenticated_access only: %i[ index show ]
   
   before_action :set_task, only: %i[ show edit update ]
   
   def index
      @project = Project.new(params[:project_id])

      # in 'All Tasks' we show Project title alongside task for quick UI lookup
      @projects = Project.all  # from this we can resolve task.project_id to project.title

      # to do : we need to associate project.title in each task - time for some Ruby!

      @tasks = Task.all


   end

   def show
      # @task is retrieved by set_task
      @project = @task.project
      @todos = @task.todos
   end

   def new
      @task = Task.new
      @project_id = params[:project_id]
   end

   def create

      # new task
      @task = Task.new(task_params)

      if @task.save
        redirect_to @task
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @project_id = params[:project_id]
    end
  
    def update
      @project_id = params[:project_id]
      if @task.update(task_params)
        redirect_to @task
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @task.destroy
      redirect_to tasks_path
    end

    private
    
      def set_task
         @task = Task.find(params[:id])
      end

      def task_params
        params.expect(task: [ :title, :project_id, :desc ])
      end


end
