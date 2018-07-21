defmodule BlogReal.Models.ArticleTest do
  use BlogReal.DataCase
  alias BlogReal.Models.Article
  import BlogReal.Factory

  @attr_invalid %{
    title: "Hell",
    content: "Hellx",
    description: "Hix",
    metadata: "dae"
  }

  describe "articles" do

    test "valid article" do
      valid_attr = params_for(:article)
      changeset = Article.changeset(%Article{}, valid_attr)
      assert changeset.valid?
    end

    test "invalid article" do
      changeset = Article.changeset(%Article{}, @attr_invalid)
      refute changeset.valid?
    end
    
  end

end
