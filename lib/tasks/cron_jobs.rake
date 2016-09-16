namespace :cron_jobs do
	
	desc "cron for restart delayed job"
	
	task run_delayed_job: :environment do
		puts "restart delayed job"
		exec "bin/delayed_job restart"
	end
end