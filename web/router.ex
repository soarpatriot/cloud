defmodule Cloud.Router do
  use Cloud.Web, :router
  # use Addict.RoutesHelper

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Cloud do
    pipe_through :browser # Use the default browser stack
    
        get "/login", SessionController, :new
        post "/login", SessionController, :create
        get "/logout", SessionController, :delete
        get "/register", RegistrationController, :new
        post "/register", RegistrationController, :create
        get "/forget-password", PasswordController, :forget_password
        post "/reset-password", PasswordController, :reset_password
    get "/", PageController, :index
    resources "/molds", MoldController
    resources "/users", UserController
    # addict :routes
  end

  # Other scopes may use custom stacks.
  # scope "/api", Cloud do
  #   pipe_through :api
  # end
end
