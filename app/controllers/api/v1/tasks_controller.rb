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
        @parent_id = Task.find(params[:id]).parent_task_id 
        @parent_id.present? ? nil : @parent_id
        @chats = set_task.chats
        # binding.pry

      end

      def new
        @task = [:api, :v1, :user, current_user.tasks.build]
        user_tasks
        @html_options = { include_blank: true }
      end

      def new_subtask
        @select_task = Task.find(params[:parent_task_id])
        @task = [:api, :v1, :user, current_user.tasks.build]
        user_tasks
        @html_options = { selected: @select_task.id } 
      end

      def edit
        @select_task = Task.find(params[:id])
        @task = %i[api v1 user].push(@select_task)
        user_tasks

        if @select_task.parent_task_id != nil
          @html_options = { selected: @select_task } 
        else
          @html_options = { include_blank: true }
        end
      end

      def create
        @task = Task.new(task_params.merge(user_id: params[:user_id]))

        if params[:task]['parent_task_id'].present?
          redirect = api_v1_user_task_path(current_user.id, params[:task]['parent_task_id'] )
        else
          redirect = api_v1_user_tasks_path(current_user.id)
        end

        respond_to do |format|
          if @task.save
            format.html { redirect_to redirect, notice: 'Task was successfully created.' }
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

        check_subtasks = Task.where(parent_task_id: params[:id].to_s).to_a.count
        if check_subtasks.zero?
          @task.destroy
          respond_to do |format|
            format.html { redirect_to :back, notice: 'Task was successfully destroyed.' }
            format.json { head :no_content }
          end
        else
          respond_to do |format|
            format.html { redirect_to :back, notice: 'Remove subtasks before.' }
            format.json { render json: {notice: 'Remove subtasks before.'} }
          end
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