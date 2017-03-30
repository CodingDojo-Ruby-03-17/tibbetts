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
      flash[:success] = "Student added to #{@dojo.branch}"
      return redirect_to controller: 'dojo', action: 'show', id: @dojo.id
    end
    flash[:error] = "All fields are required."
    return redirect_to action: 'new', dojo_id: @dojo.id 
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
    return redirect_to action: "show", dojo_id: params[:student][:dojo_id], id: params[:id]
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    return redirect_to controller: 'dojo', action: 'show', id: student.dojo_id
  end

  private 
    def protect_params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end

end
