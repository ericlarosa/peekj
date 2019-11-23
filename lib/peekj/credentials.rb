module Peekj
  class Credentials
    KEYS = %w[app_url username api_token]

    class << self
      KEYS.each do |credential_key|
        define_method :"#{credential_key}" do
          keychain_password(credential_key)
        end


        define_method :"#{credential_key}=" do |credential_value|
          add_or_update_keychain_password(credential_key, credential_value)
        end
      end

      private

      def add_or_update_keychain_password(key, password)
        system "security add-generic-password -U -a 'peekj' -s '#{key}' -w '#{password}'"
      end

      def keychain_password(key)
        `security find-generic-password -a 'peekj' -s #{key} -w`.chomp
      end
    end
  end
end