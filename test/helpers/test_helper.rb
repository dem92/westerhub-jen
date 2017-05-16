class ActiveSupport::TestCase
  fixtures :all
end

class ActionController::TestCase
  include Devise::Test::ControllerHelpers
end