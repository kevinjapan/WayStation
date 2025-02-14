class ProjectsController < ApplicationController
   
   allow_unauthenticated_access only: %i[ index show ]
   
   before_action :set_project, only: %i[ show edit update destroy ]


   def index

      @projects = Project.all
      @programmes = Programme.all

      @augmented_projects = []
      the_augmented_projects = []

      # create list augmented w/ project.title
      @projects.each do |project|
         my_programme = Programme.find(project.programme_id)
         augmented_project = [project,my_programme]
         the_augmented_projects.push(augmented_project)
      end

      # sort by project and project title
      @augmented_projects = the_augmented_projects.sort_by { |project, programme| [programme.title, project.title] }
   end

   def show
      # @project is retrieved by set_project
      @programme = @project.programme
      @tasks = @project.tasks
      @comments = @project.comments
   end

   def new
      @project = Project.new
      @programme_id = params[:programme_id]
      @programme = Programme.find(@programme_id)
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
      @programme = Programme.find(@programme_id)
    end
  
    def update
      @programme_id = params[:programme_id]
      if @project.update(project_params)
        redirect_to @project
      else
         flash[:notice] = "The project failed to update " + @project.inspect
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
         params.expect(project: [ :title, :programme_id, :tagline ])
      end


end
