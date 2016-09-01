Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    Rails.application.secrets.auth_o_clientid,
    Rails.application.secrets.auth_o_key,
    'maggiemccain.au.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end
