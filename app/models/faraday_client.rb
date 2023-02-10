class FaradayClient
    attr_accessor :conn
    def initialize(dynamodb_users = "https://8ilsokdkbj.execute-api.us-east-2.amazonaws.com/stoquotesusersv1/users")
        @conn = Faraday.new(
            url: dynamodb_users,
            headers: {'Content-type': 'application/json'},
        )
    end
end