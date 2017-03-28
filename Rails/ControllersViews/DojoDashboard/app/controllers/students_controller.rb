class StudentsController < ApplicationController

  def index
    @students = Dojo.find(params[:id]).students
  end

  def new
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.new()
  end

  def create
    @dojo = Dojo.find(params[:dojo_id])
    if @dojo.students.create( protect_params ).valid?
      return redirect_to "/dojos/show/#{@dojo.id}/"
    end
    return redirect_to "/dojos/#{@dojo.id}/students/new" 
  end

  def show
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
    @dojo = Dojo.find(params[:dojo_id])
  end

  def update
    Student.find(params[:id]).update( protect_params ) 
    return redirect_to "/dojos/#{params[:student][:dojo_id]}/students/#{params[:id]}"
  end

  def destroy
    Student.find(params[:id]).destroy
    return redirect_to "/dojos/show/#{params[:dojo_id]}"
  end

  private 
    def protect_params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end

end
