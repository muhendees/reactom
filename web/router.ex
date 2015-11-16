defmodule Reactom.Router do
  use Reactom.Web, :router

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

  scope "/", Reactom do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index 
  end

  # Other scopes may use custom stacks.
  scope "/api", Reactom do
    pipe_through :api
    resources "/articles", ArticleController, except: [:new, :edit]
    resources "/commeaaaaaants", CommentController, except: [:new, :edit]
    resources "/products", ProductController, except: [:new, :edit]
    resources "/comments", DataController, except: [:new, :edit]
  end
end
