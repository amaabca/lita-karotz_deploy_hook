require "spec_helper"
require 'rest_client'

describe Lita::Handlers::KarotzDeployHook, lita_handler: true do
  it 'posts data to the Karotz deployments endpoint' do
    expect(RestClient).to receive(:post)
    send_message "teddy is starting deploy of 't_y_l_f' from branch 'ice-cream' to production"
  end
end
