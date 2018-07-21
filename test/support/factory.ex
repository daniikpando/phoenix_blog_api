defmodule BlogReal.Factory do

  use ExMachina.Ecto, repo: BlogReal.Repo

  def article_factory do
    %BlogReal.Models.Article {
      title: "Hello World in phoenix",
      content: "Hello World in phoenix",
      description: "Hello World in phoenix",
      metadata: %{"something" => "something"}
    }
  end

  def comment_factory do
    %BlogReal.Models.Comment {
      content: "Este es un comentario valido"
    }
  end
end
