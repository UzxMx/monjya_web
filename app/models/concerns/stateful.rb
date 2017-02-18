module Stateful
  extend ActiveSupport::Concern

  included do
    enum state: {draft: 0, published: 1, deleted: 2}
  end
end