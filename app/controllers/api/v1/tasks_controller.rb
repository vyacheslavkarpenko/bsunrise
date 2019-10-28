module Api
  module V1
    class TasksController < ApplicationController
      before_action :set_task, only: [:show, :edit, :update, :destroy]

      def index
        @tasks = Task.where(user_id: current_user, parent_task_id: nil)
      end

      def show
        set_task
        @child_task = Task.where(parent_task_id: @task.id)
      end

      def new
        @task = [:api, :v1, :user, current_user.tasks.build]
        user_tasks
        binding.pry
      end

      def edit
        @task = [:api, :v1, :user, Task.find(params[:id])]
        user_tasks
      end

      def create
        @task = Task.new(task_params.merge(user_id: params[:user_id], parent_task_id: params[:parent_task_id]))

        respond_to do |format|
          if @task.save
            format.html { redirect_to api_v1_user_tasks_path(current_user.id), notice: 'Task was successfully created.' }
            format.json { render :show, status: :created, location: api_v1_user_tasks_path(current_user.id) }
          else
            format.html { render :new }
            format.json { render json: api_v1_user_tasks_path(current_user.id).errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @task.update(task_params)
            format.html { redirect_to api_v1_user_tasks_path(current_user.id), notice: 'Task was successfully updated.' }
            format.json { render :show, status: :ok, location: @task }
          else
            format.html { render :edit }
            format.json { render json: @task.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @task.destroy
        respond_to do |format|
          format.html { redirect_to  api_v1_user_tasks_path(current_user.id), notice: 'Task was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private

      def set_task
        @task = Task.find(params[:id])
      end

      def user_tasks
        @user_tasks = current_user.tasks if current_user.tasks
      end

      def task_params
        params.require(:task).permit(:name, :description, :parent_task_id)
      end
    end
  end
end