class ProgrammesController < ApplicationController

   allow_unauthenticated_access only: %i[ index show ]

   before_action :set_programme, only: %i[ show edit update ]

   def index
      @programmes = Programme.all
   end

   def show
      # @programme is retrieved by set_programme
      @projects = @programme.projects
   end

   def new
      @programme = Programme.new
   end

   def create
      @programme = Programme.new(programme_params)
      if @programme.save
         # when redirect_to is given an Active Record object, Rails generates a path for that record's show action:
         redirect_to @programme
      else
         #  save, unsuccessful: re-render the form so the user can fix the invalid data - render :new - redirects to new action w/ @programme
         #  set HTTP status to (422) Unprocessable Entity to tell the browser this POST request failed and to handle it accordingly.
         render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @programme.update(programme_params)
         redirect_to @programme
      else
         render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @programme.destroy
      redirect_to programmes_path
    end

    private

      def set_programme
         @programme = Programme.find(params[:id])
      end

      # permitted parameters
      def programme_params
         params.expect(programme: [ :title, :desc ])
      end


end
