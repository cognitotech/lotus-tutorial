module Web::Views::Home
  class Index
    include Web::View

    def header
      if current_user
        signed_in_user_header
      else
        guest_user_header
      end
    end

    private

    def guest_user_header
      raw(%(<h2>You are not signed in</h2>
        <p>Please sign in to see your tweets or <a class="btn btn-primary" href="/registration" role="button">Sign Up</a></p>))
    end

    def signed_in_user_header
      raw('<h2>All tweets</h2>')
    end
  end
end
