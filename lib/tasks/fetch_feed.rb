require 'feedjira'

class Tasks::FetchFeed

  def self.execute
    logger = Logger.new('log/tasks_fetch_feed.log')

    Feed.all.each do |feed|

      parsed_feed = Feedjira::Feed.fetch_and_parse(feed.url)

      if not parsed_feed or parsed_feed.instance_of?(Fixnum) then
        logger.info 'Skipped ' + feed.url
        logger.debug parsed_feed.inspect
        next
      end

      parsed_feed.entries.reverse.each do |parsed_entry|

        if parsed_entry.last_modified <= feed.last_modified then
          logger.info "skip already exist entry, (parsed entry last modified = #{parsed_entry.last_modified.to_s}) <=  (feed last modified = #{feed.last_modified.to_s})"
          logger.info "skipped entry info, #{parsed_entry.url} #{parsed_entry.title}"
          next
        end

        if parsed_entry.last_modified < feed.last_modified then
          next
        end

        unless feed.entry_title_selector == nil then
          unless Regexp.compile(feed.entry_title_selector) =~ parsed_entry.title then
            logger.info "didn't select entry, " +
                        "entry title = " + parsed_entry.title +
                        "entry_title_selector = " + feed.entry_title_selector.to_s
            next
          end
        end

        entry = Entry.new({
          :title        => parsed_entry.title,
          :url          => parsed_entry.url,
          :summary      => parsed_entry.summary,
          :published_at => parsed_entry.published,
          :feed_id      => feed.id,
          :view_count   => 0
          })
        entry.save
        logger.info "fetched entry info, #{parsed_entry.url} #{parsed_entry.title}"
      end

      # update feed data
      feed.title = parsed_feed.title
      feed.last_modified = parsed_feed.last_modified
      feed.save
    end
  end

end
