require "spec_helper"
require 'rest_client'

describe Lita::Handlers::KarotzDeployHook, lita_handler: true do
  it 'posts data to the Karotz deployments endpoint' do
    Lita.config.handlers.karotz_deploy_hook.karotz_deployment_endpoint = 'http://www.google.com/deployments'
    expect(RestClient).to receive(:post)
    send_message "Teddy Ruxbin is starting deploy of 't_y_l_f' from branch 'ice-cream' to production"
  end

  it 'throws an exception when endpoint not set' do
    expect {
      send_message "Teddy Ruxbin is starting deploy of 't_y_l_f' from branch 'ice-cream' to production"
    }.to raise_error
  end
end
