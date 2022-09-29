class StudentsController < ApplicationController
  
  def index
    students =
        if params[:name]
          Student.where("first_name LIKE ? OR last_name LIKE ?", "%#{params[:name]}%","%#{params[:name]}%")
        else
          Student.all
        end
        render json: students , methods: :to_s 
  end

  def show
    student = Student.find_by_id( params[:id])
    if student
      render json: student, except: [:created_at, :updated_at], methods: :to_s
    else  
      render json: {error: 'Student not found'}, status: :not_found
    end  
  end

end
