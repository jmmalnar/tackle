Rails.application.config.middleware.use OmniAuth::Builder do  
  if RAILS_ENV == 'production' then
    provider :github, '4ffcf667d5aeaa52ac7a', 'a0968652c83e4e89dd5062b956b7011f3c6c00cf'
  else
    provider :github, 'd191ee3944195bbe74eb', '2720335c5c74831c5acfc1044c3eab36e26adeef'
  end
end 