#!/usr/bin/env ruby

require 'logger'

logger = Logger.new("logfile_demo.log")
logger.level = Logger::DEBUG

logger.debug("setup complete")
logger.info("For your information")
logger.warn("We've warned you a couple of times now.")
logger.fatal("We are just plain crashing here...")
logger.error("Alright, this is an error.")
logger.unknown("Now what?")
