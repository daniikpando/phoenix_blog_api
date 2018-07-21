defmodule BlogReal.Models.CommentTest  do
  use BlogReal.DataCase
  alias BlogReal.Models.Comment
  import BlogReal.Factory

  @attr_invalid %{
    content: "",
    article_id: -1
  }

  setup do
    {:ok, article: insert(:article)}
  end

  test "valid comment", %{article: article} do
    valid_attr = Map.put(params_for(:comment), :article_id, article.id)
    changeset = Comment.changeset( %Comment{}, valid_attr)
    assert changeset.valid?
  end

  test "invalid comment" do
      changeset = Comment.changeset( %Comment{}, @attr_invalid)
      IO.inspect changeset
      refute changeset.valid?
  end



end
