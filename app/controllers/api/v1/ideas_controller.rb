module Api
  module V1
    class IdeasController < ApiController
      respond_to :json

      def index
        respond_with Idea.descending
      end

      def create
        render json: Idea.create(idea_params)
      end

      def destroy
        render json: Idea.destroy(params[:id])
      end

      private

      def idea_params
        params.require(:idea).permit(:title, :body, :quality)
      end
    end
  end
end
