class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(request = {})
    @request = request
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @authenticated_user ||= User.find(1) if local_develop_request
    @authenticated_user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @authenticated_user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if @request.headers['JWT-Authorization'].present?
      return @request.headers['JWT-Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end

  def local_develop_request
    Rails.env.development? && @request.original_url == "http://localhost:3000/api/v1/graphql"
  end
end
