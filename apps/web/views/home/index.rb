module Web::Views::Home
  class Index
    include Web::View

    def header
      raw(%(<h2>You are not signed in</h2>
        <p>Please sign in to see your tweets or <a class="btn btn-primary" href="/registration" role="button">Sign Up</a></p>))
    end
  end
end
