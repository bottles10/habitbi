class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # FIXME: Fix header, navigation and notifiction position
  # COMPLETED: Implement awards for habits
  # TODO: Minus count removes award if less than required count to have award
  # COMPLETED: Implement user cannot plus more than date last count and current date
  # COMPLETED Add no habits banner if no habits presents
  # TODO: Style session pages
  # TODO: show habits count
end
