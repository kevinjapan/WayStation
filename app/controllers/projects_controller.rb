class ProjectsController < ApplicationController
   
   allow_unauthenticated_access only: %i[ index show ]
   
   before_action :set_project, only: %i[ show edit update ]

   # The index method here is an Action. Even though it's an empty method, 
   # Rails will default to rendering a template (view) with the matching name.
   def index
      @projects = Project.all
   end

   def show
      # @project is retrieved by set_project
      @programme = @project.programme
      @tasks = @project.tasks
   end

   def new
      @project = Project.new
      @programme_id = params[:programme_id]
   end

   def create
      @project = Project.new(project_params)
      if @project.save
        redirect_to @project
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @programme_id = params[:programme_id]
    end
  
    def update
      @programme_id = params[:programme_id]
      if @project.update(project_params)
        redirect_to @project
      else
        render :edit, status: :unprocessable_entity
      end
    end
 
    def destroy
      @project.destroy
      redirect_to projects_path
    end

    private
    
      def set_project
         @project = Project.find(params[:id])
      end
      
      def project_params
         params.expect(project: [ :title, :programme_id, :desc ])
      end


end
