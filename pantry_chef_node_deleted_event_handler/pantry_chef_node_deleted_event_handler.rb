module Wonga
  module Daemon
    class PantryChefNodeDeletedEventHandler
      def initialize(api_client, logger, path)
        @api_client = api_client
        @logger = logger
        @path = path
      end

      def handle_message(message)
        @logger.info "Sending chef deleted event back to Pantry with instance ID #{message['id']}"
        @api_client.send_delete_request("/api/chef_nodes/#{message['id']}", message)
      end
    end
  end
end
