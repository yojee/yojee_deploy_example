defmodule YojeeChatExample.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias YojeeChatExample.Accounts.User


  schema "users" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
