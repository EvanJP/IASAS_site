    Rails.application.config.middleware.use OmniAuth::Builder do
        provider :google_oauth2, Rails.application.secrets.secret_key_base, Rails.application.secrets.secret_token, 
            skip_jwt: true, 
            scope: 'profile, email',
            image_aspect_ratio: 'square', 
            image_size: 48, 
            access_type: 'online', 
            hd: 'tas.tw',
            name: 'google'
    end