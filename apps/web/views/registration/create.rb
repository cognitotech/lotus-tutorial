require_relative 'form'
module Web::Views::Registration
  class Create
    include Web::View
    include Form

    template '/registration/index'
  end
end
