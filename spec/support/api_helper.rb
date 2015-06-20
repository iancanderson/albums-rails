module ApiHelper
  JSON_HEADERS = {
    "Accept"        => "application/json",
    "Content-Type"  => "application/json",
  }.freeze

  def json_response
    JSON.parse(response.body)
  end

  def options(*args)
    reset! unless integration_session
    integration_session.__send__(:process, :options, *args).tap do
      copy_session_variables!
    end
  end

  def json_get(path, params = {}, headers_or_env = {})
    get(path, params, json_headers(headers_or_env))
  end

  def json_delete(*args)
    path, params, headers_with_auth = process_arguments(*args)

    delete(path, params.to_json, headers_with_auth)
  end

  def json_patch(*args)
    path, params, headers_with_auth = process_arguments(*args)

    patch(path, params.to_json, headers_with_auth)
  end

  def json_post(*args)
    path, params, headers_with_auth = process_arguments(*args)

    post(path, params.to_json, headers_with_auth)
  end

  def json_put(*args)
    path, params, headers_with_auth = process_arguments(*args)

    put(path, params.to_json, headers_with_auth)
  end

  private

  def json_headers(headers = {})
    JSON_HEADERS.reverse_merge(headers)
  end

  def process_arguments(path, params = {}, headers_or_env = {})
    api_token = params.delete(:api_token)
    headers_with_auth = headers_or_env.reverse_merge(
      "HTTP_AUTHORIZATION" => "Token token=#{api_token}"
    )

    [path, params, json_headers(headers_with_auth)]
  end
end

RSpec.configure do |config|
  config.include ApiHelper, type: :request
end
