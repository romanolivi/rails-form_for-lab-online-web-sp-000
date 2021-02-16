class SchoolClassesController < ApplicationController
    def index 
        @school_classes = SchoolClass.all
    end

    def show 
        @school_class = SchoolClass.find(params[:id])
    end

    def new 
        @school_class = SchoolClass.new 
    end

    def create 
        @school_class = SchoolClass.new(post_params(:title, :room_number))
        @school_class.save 
        redirect_to school_class_path(@school_class)
    end

    def edit 
        @class = SchoolClass.find(params[:id])
    end

    def update 
        @class = SchoolClass.find(params[:id])
        @class = SchoolClass.update(post_params(:title, :room_number))
        redirect_to school_class_path(@class)
    end

    private 

    def post_params(*args) 
        params.require(:school_class).permit(*args)
    end

end
