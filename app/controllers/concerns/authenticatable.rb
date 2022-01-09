# class SignedInChecker
#   def self.before(controller)
#     unless controller.send(:signed_in?)
#       controller.flash[:notice] = I18n.t 'authenticate.signed_in_checker.common'
#       controller.redirect_to controller.user_session_path
#     end
#   end
# end