require_relative "usersbook"
require_relative "list"
require_relative "view"

class Controller
  def initialize(usersbook)
    @usersbook = usersbook
    @view = View.new
  end

  def list
    @usersbook.all
    display_lists
  end

  def export
    @usersbook.export
    @view.done_export
  end

  private

  def display_lists
    @view.display(@usersbook.all)
  end
end
