defmodule BlogReal.Models.ArticleTest do
  use BlogReal.DataCase
  alias BlogReal.Models.Article

  @attr_valid %{
    title: "Hello World in phoenix",
    content: "Hello World in phoenix",
    description: "Hello World in phoenix",
    metadata: %{"something" => "something"}
  }

  @attr_invalid %{
    title: "Hell",
    content: "Hellx",
    description: "Hix",
    metadata: "dae"
  }

  test "valid article" do
    changeset = Article.changeset(%Article{}, @attr_valid)
    assert changeset.valid?
  end

  test "invalid article" do
    changeset = Article.changeset(%Article{}, @attr_invalid)
    IO.inspect changeset.errors()
    refute changeset.valid?
  end

end
