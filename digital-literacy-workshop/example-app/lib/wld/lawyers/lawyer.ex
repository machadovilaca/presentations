defmodule Wld.Lawyers.Lawyer do
  use Ecto.Schema
  import Ecto.Changeset

  import Ecto.Query, warn: false
  alias Wld.Repo

  schema "lawyers" do
    field :birthday, :date
    field :first_name, :string
    field :last_name, :string

    many_to_many :practice_areas, Wld.Courts.PracticeArea, join_through: "lawyer_practice_areas", on_replace: :delete, on_delete: :delete_all

    has_many :cases, Wld.Courts.Case

    timestamps()
  end

  @doc false
  def changeset(lawyer, attrs) do
    lawyer
    |> cast(attrs, [:first_name, :last_name, :birthday])
    |> validate_required([:first_name, :last_name, :birthday])
    |> put_assoc(:practice_areas, get_practice_areas(attrs))
  end

  defp get_practice_areas(attrs) do
    practice_areas = (attrs["practice_areas"] || []) |> Enum.map(&String.to_integer/1)
    Repo.all(from pa in Wld.Courts.PracticeArea, where: pa.id in ^practice_areas)
  end
end
