module UserManager
    class FirebaseAuth < ApplicationService
        def self.generate_token(user)
            # byebug
            service_account_email = ENV["FIREBASE_SERVICE_ACCOUNT_EMAIL"]
            private_key = OpenSSL::PKey::RSA.new ENV["FIREBASE_PRIVATE_KEY"]
              
            now_seconds = Time.now.to_i
            payload = {
              iss: service_account_email,
              sub: service_account_email,
              aud: "https://identitytoolkit.googleapis.com/google.identity.identitytoolkit.v1.IdentityToolkit",
              iat: now_seconds,
              exp: now_seconds + (60*60), # Maximum expiration time is one hour
              uid: user.id,
            }
            JWT.encode payload, private_key, "RS256"
        end
    end
end