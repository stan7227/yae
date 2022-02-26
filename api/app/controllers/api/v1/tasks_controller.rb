module Api::V1
  class TasksController < ApplicationController
    def index
      tasks = Task.all.order(updated_at: :desc)
      render json: tasks, each_serializer: Api::V1::TaskSerializer
    end

    def show
      task = task.find(params[:id])
      render json: task, serializer: Api::V1::Taskserializer
    end

    def create
      task = current_user.tasks.create!(task_params)
      render json: task, serializer: Api::V1::Taskserializer
    end

    def update
      task = current_user.tasks.find(params[:id])
      task.update!(task_params)
      render json: task, serializer: Api::V1::Taskserializer
    end

    def destroy
      task = current_user.tasks.find(params[:id])
      task.destroy!
    end

    private

      def task_params
        params.require(:task).permit(:title, :body)
      end
  end
end
