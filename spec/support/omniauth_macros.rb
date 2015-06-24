module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {"provider"=>"facebook",
       "uid"=>"10108902578054104",
       "info"=>
        {"email"=>"jorge@turing.io",
         "name"=>"Jorge Snow",
         "first_name"=>"Jorge",
         "last_name"=>"Snow",
         "image"=>"http://graph.facebook.com/10108902578054104/picture",
         "urls"=>{"Facebook"=>"https://www.facebook.com/app_scoped_user_id/10108902578054104/"},
         "verified"=>true},
       "credentials"=>
        {"token"=>
          "amkaaaaaasdadadasdaldjldjlwjflwhgl;jwljwlfjlwlwjlwjdlwjedl;wjedljdl;jweldjwe",
         "expires_at"=>1440266626,
         "expires"=>true},
       "extra"=>
        {"raw_info"=>
          {"id"=>"10108902578054104",
           "email"=>"jorge@turing.io",
           "first_name"=>"Jorge",
           "gender"=>"male",
           "last_name"=>"Snow",
           "link"=>"https://www.facebook.com/app_scoped_user_id/10108902578054104/",
           "locale"=>"en_US",
           "name"=>"Jorge Snow",
           "timezone"=>-6,
           "updated_time"=>"2015-06-06T13:57:36+0000",
           "verified"=>true}}})
  end
end
