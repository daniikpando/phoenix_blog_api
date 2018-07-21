defmodule BlogRealWeb.Router do
  use BlogRealWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BlogRealWeb.Api, as: :api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/articles", ArticleController, except: [:new, :edit] do
        resources "/comments", CommentController, except: [:new, :edit]
      end
    end
  end

end
