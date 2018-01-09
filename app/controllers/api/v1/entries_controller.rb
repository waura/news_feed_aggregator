module Api
  module V1

    class EntriesController < ApplicationController

      def index

        orderd     = params[:orderd] || "date"
        start_date = params[:start_date] || "1970-1-1 00:00:00"
        limit      = params[:limit] || 50

        date_exp = ""
        if not DateTime.parse(start_date)
          raise
        end

        order_exp = ""
        if (orderd == "view_count")
          order_exp = "view_count desc"
        else
          order_exp = "published_at desc"
        end        

        @entries = Entry.all.order(order_exp).where("published_at >= ?", start_date).limit(limit)
        render json: {"entries" => @entries}
      end

    end

  end
end

