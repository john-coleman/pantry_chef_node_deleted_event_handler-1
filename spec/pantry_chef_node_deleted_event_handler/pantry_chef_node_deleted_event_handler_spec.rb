require 'spec_helper'
require_relative '../../pantry_chef_node_deleted_event_handler/pantry_chef_node_deleted_event_handler'

describe Wonga::Daemon::PantryChefNodeDeletedEventHandler do
  let(:api_client) { instance_double('Wonga::Daemon::PantryApiClient').as_null_object }
  let(:logger) { instance_double('Logger').as_null_object }
  let(:message) { {'id' => '1'} }
  subject { described_class.new(api_client, logger, 'http://localhost:3000/api/chef_nodes') }
  it_behaves_like "handler"
  
  describe "#handle_message" do
    it "updates Pantry using PantryApiClient" do
      expect(api_client).to receive(:send_delete_request)
      subject.handle_message(message)
    end
  end
end
