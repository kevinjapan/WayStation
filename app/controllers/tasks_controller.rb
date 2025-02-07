class TasksController < ApplicationController

   allow_unauthenticated_access only: %i[ index show ]
   
   before_action :set_task, only: %i[ show edit update destroy ]


   def index

      @projects = Project.all
      @tasks = Task.all

      @augmented_tasks = []
      the_augmented_tasks = []

      # create list augmented w/ project.title
      @tasks.each do |task|
         my_project = Project.find(task.project_id)
         augmented_task = [task,my_project]
         the_augmented_tasks.push(augmented_task)
      end

      # sort by project and task title
      @augmented_tasks = the_augmented_tasks.sort_by { |task, project| [project.title, task.title] }
   end

   def show
      # @task is retrieved by set_task
      @project = @task.project
      @todos = @task.todos
      @comments = @task.comments
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
         flash[:notice] = "The task failed to update " + @task.inspect
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
