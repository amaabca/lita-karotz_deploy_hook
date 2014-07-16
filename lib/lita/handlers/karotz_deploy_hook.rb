require 'rest_client'

module Lita
  module Handlers
    class KarotzDeployHook < Handler
      def self.default_config(config)
        config.karotz_deployment_endpoint = ''
      end

      route(/(.*) is starting deploy of '(.*)' from branch '(.*)' to (.*)/i, :notify_karotz, command: false,
        help: { "<user_name> is starting deploy of '<project_name>' from branch '<branch_name>' to <environment_name>" =>
                "Sends a directive to Karotz to vocalize the deployment details." }
      )

      def notify_karotz(message)
        matches = message.matches[0]
        data = { deployer: matches[0], project: matches[1], branch: matches[2], environment: matches[3] }
        RestClient.post "#{karotz_deployment_endpoint}?#{query_string(data)}", {}
      end

    private

      def karotz_deployment_endpoint
        Lita.config.handlers.karotz_deploy_hook.karotz_deployment_endpoint
      end

      def query_string(hash)
        hash.map do |key, value|
          "#{key}=#{value}"
        end.join "&"
      end
    end

    Lita.register_handler(KarotzDeployHook)
  end
end
