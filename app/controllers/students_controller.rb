class StudentsController < ApplicationController

  def index
    student = 
    if params[:name] 
      Student.where("last_name LIKE ? OR first_name LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%") 
    else
       Student.all
    end  
    render json: student, except: [:created_at, :updated_at, :id]
  end
  
  def show
    student = Student.find(params[:id])
    render json: student
  end


end
