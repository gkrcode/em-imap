require 'net/imap'

require 'rubygems'
require 'eventmachine'
require 'deferrable_gratification'

$:.unshift File.dirname( __FILE__ )
require 'imap/command_sender'
require 'imap/response_parser'
require 'imap/connection'
require 'imap/client'
$:.shift

module EventMachine
  module Imap
    def self.connect(host, port, ssl=false)
      conn = EventMachine.connect(host, port, EventMachine::Imap::Connection)
      conn.start_tls if ssl
      Client.new(conn)
    end
  end
end