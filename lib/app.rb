require_relative 'list'
require_relative 'controller'
require_relative 'router'

csv_file = File.join(__dir__, 'input.csv')
usersbook = Usersbook.new(csv_file)
controller = Controller.new(usersbook)

router = Router.new(controller)

# Start the app
router.run
