defmodule BlogReal.Models.CommentTest  do
  use BlogReal.DataCase
  alias BlogReal.Models.Comment

  @attr_valid %{
    content: "Este es un comentario valido",
    article_id: 1
  }
  @attr_invalid %{
    content: "",
    article_id: 1
  }

  # setup do
  # end

  test "valid comment" do
    changeset = Comment.changeset( %Comment{}, @attr_valid)
    assert changeset.valid?
  end

  test "invalid comment" do
      changeset = Comment.changeset( %Comment{}, @attr_invalid)
      refute changeset.valid?
  end



end
