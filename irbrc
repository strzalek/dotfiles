require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'
require 'logger'
require 'active_record'
require "awesome_print"

IRB.conf[:AUTO_INDENT] = true;
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history" 
IRB.conf[:PROMPT_MODE]  = :SIMPLE


def enable_logger
    log_to(Logger.new(STDOUT))
end

def disable_logger
    log_to(nil)
end

def log_to(logger)
    ActiveRecord::Base.logger = logger
    ActiveRecord::Base.clear_active_connections!
end

# logging into console by default
enable_logger
