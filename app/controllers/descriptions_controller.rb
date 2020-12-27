class DescriptionsController < ApplicationController
  def description_params
    params.require(:descriptions).permit(:header, :description)
  end

  def show
    id = params[:id]
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