class DescriptionsController < ApplicationController
  def description_params
    params.require(:descriptions).permit(:project_title, :images, :description)
  end

  def show
    id = params[:id]
    format = params[:format]
    @descriptions = Description.all
    if id.include? "experience"
      render descriptions_experience_path
    elsif id.include? "education"
      render descriptions_education_path
    elsif id.include? "skills"
      render descriptions_skills_path
    elsif id.include? "contactme"
      render descriptions_contactme_path
    elsif id.include? "github"
      render descriptions_github_path
    elsif id.include? "images"
      @images = Description.find(format)
      render descriptions_images_path
    elsif id.include? "game"
      render session_path
    else
      @description = Description.find(id)
    end
  end

  def index
    @descriptions = Description.all
  end

  def new
    # default: render 'new' template
  end

  def create

  end
end