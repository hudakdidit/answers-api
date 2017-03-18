module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  def body_as_json
    json_str_to_hash(response.body)
  end

  def json_str_to_hash(str)
    JSON.parse(str).with_indifferent_access
  end

  def jwt_header
    user = create(:user)
    command = AuthenticateUser.call(user.email, user.password)

    if command.success?
      { 'JWT-Authorization': command.result }
    else
      nil
    end
  end
end
