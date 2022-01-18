class CustomAuthFailure < Devise::FailureApp
  # 401 token 過期錯誤用JSON 的接法 → 目前用不到
  # def respond
  #   self.status = 401
  #   self.content_type = 'json'
  #   self.response_body = {errors: "Invalid login credentials"}.to_json
  # end
end