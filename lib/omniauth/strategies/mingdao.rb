require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Mingdao < OmniAuth::Strategies::OAuth2
      option :name, "mingdao"
      option :provider_ignores_state, true

      option :client_options, {
          :site           => "https://api.mingdao.com",
          :authorize_url  => "/oauth2/authorize",
          :token_url      => "/oauth2/access_token",
          :token_method   =>:get
      }

      option :token_params, {
          :parse          => :json,
          :format        => :json
      }

      uid do
        raw_info['id']
      end

      info do
        {
            :nickname     => raw_info['name'],
            :name         => raw_info['name'],
            :image        => raw_info['avstar'],
            :email        => raw_info['email']
        }
      end

      extra do
        {
            :raw_info => raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:parse] = :json
        access_token.options[:param_name] = 'access_token'

        @raw_info ||= client.request(:get, "https://api.mingdao.com/passport/detail", :params => {
            :format => :json,
            :access_token => access_token.token
        }, :parse => :json).parsed['user']
      end

    end
  end
end

OmniAuth.config.add_camelization "mingdao", "Mingdao"
