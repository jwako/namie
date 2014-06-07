namespace :scheduler do

  task :notify_event => :environment do
    logger = Logger.new("log/notify_event_#{Time.now.strftime('%Y_%m_%d_%H_%M')}.log")
    start_time = Time.now
    logger.info "notify_event at #{start_time}"
		
    @works = Work.where(:start_at => DateTime.now - 15.minutes..DateTime.now)

		@works.each do |work|
      begin
        NotifyEventMailer.notify_user(work).deliver
        NotifyEventMailer.notify_supporter(work).deliver
      rescue => e
        logger.info e.to_s
      end
		end

    end_time = Time.now
    logger.info "successfully done at #{end_time}"
    logger.info "Duration: #{(end_time - start_time).round(1)} sec."
  end

end