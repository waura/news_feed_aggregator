module Api
  module V1

    class FeedsController < ApplicationController

      def index
        @feeds = Feed.all
        render json: {"feeds" => @feeds}
      end

    end

  end
end