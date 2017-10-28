class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_params)
    redirect_to todos_path
    todo.save
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  def list
    @completed = completed_todos
    @uncompleted = uncompleted_todos
  end

  private
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end

  def completed_todos
    Todo.where(:completed => true)
  end

  def uncompleted_todos
    Todo.where(:completed => false)
  end

end
