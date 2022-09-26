class StudentsController < ApplicationController

  def index
    
    students = 
    if params[:name] 
        Student.find_by_last_name(params[:name]) || Student.find_by_first_name(params[:name])  
    else
       Student.all
    end  
     
    render json: students, only: [:first_name, :last_name, :grade] 
  end
  
  def show
    student = Student.find(params[:id])
    render json: student
  end


end
