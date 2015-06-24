module Helpers
	def user_logs_in_with_facebook
    visit root_path

    mock_auth_hash

    within("#user-widget") do
      click_link('Facebook')
    end
	end
end
