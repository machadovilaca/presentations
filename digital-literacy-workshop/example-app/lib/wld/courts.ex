defmodule Wld.Courts do
  @moduledoc """
  The Courts context.
  """

  import Ecto.Query, warn: false
  alias Wld.Repo

  alias Wld.Courts.PracticeArea

  @doc """
  Returns the list of practice_areas.

  ## Examples

      iex> list_practice_areas()
      [%PracticeArea{}, ...]

  """
  def list_practice_areas do
    Repo.all(PracticeArea)
  end

  @doc """
  Gets a single practice_area.

  Raises `Ecto.NoResultsError` if the Practice area does not exist.

  ## Examples

      iex> get_practice_area!(123)
      %PracticeArea{}

      iex> get_practice_area!(456)
      ** (Ecto.NoResultsError)

  """
  def get_practice_area!(id), do: Repo.get!(PracticeArea, id)

  @doc """
  Creates a practice_area.

  ## Examples

      iex> create_practice_area(%{field: value})
      {:ok, %PracticeArea{}}

      iex> create_practice_area(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_practice_area(attrs \\ %{}) do
    %PracticeArea{}
    |> PracticeArea.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a practice_area.

  ## Examples

      iex> update_practice_area(practice_area, %{field: new_value})
      {:ok, %PracticeArea{}}

      iex> update_practice_area(practice_area, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_practice_area(%PracticeArea{} = practice_area, attrs) do
    practice_area
    |> PracticeArea.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a practice_area.

  ## Examples

      iex> delete_practice_area(practice_area)
      {:ok, %PracticeArea{}}

      iex> delete_practice_area(practice_area)
      {:error, %Ecto.Changeset{}}

  """
  def delete_practice_area(%PracticeArea{} = practice_area) do
    Repo.delete(practice_area)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking practice_area changes.

  ## Examples

      iex> change_practice_area(practice_area)
      %Ecto.Changeset{data: %PracticeArea{}}

  """
  def change_practice_area(%PracticeArea{} = practice_area, attrs \\ %{}) do
    PracticeArea.changeset(practice_area, attrs)
  end

  alias Wld.Courts.Case

  @doc """
  Returns the list of cases.

  ## Examples

      iex> list_cases()
      [%Case{}, ...]

  """
  def list_cases do
    Repo.all(Case) |> Repo.preload([:practice_area, :lawyer])
  end

  @doc """
  Gets a single case.

  Raises `Ecto.NoResultsError` if the Case does not exist.

  ## Examples

      iex> get_case!(123)
      %Case{}

      iex> get_case!(456)
      ** (Ecto.NoResultsError)

  """
  def get_case!(id) do
    Repo.get!(Case, id) |> Repo.preload([:practice_area, :lawyer])
  end

  @doc """
  Creates a case.

  ## Examples

      iex> create_case(%{field: value})
      {:ok, %Case{}}

      iex> create_case(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_case(attrs \\ %{}) do
    %Case{}
    |> Case.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a case.

  ## Examples

      iex> update_case(case, %{field: new_value})
      {:ok, %Case{}}

      iex> update_case(case, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_case(%Case{} = case, attrs) do
    case
    |> Case.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a case.

  ## Examples

      iex> delete_case(case)
      {:ok, %Case{}}

      iex> delete_case(case)
      {:error, %Ecto.Changeset{}}

  """
  def delete_case(%Case{} = case) do
    Repo.delete(case)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking case changes.

  ## Examples

      iex> change_case(case)
      %Ecto.Changeset{data: %Case{}}

  """
  def change_case(%Case{} = case, attrs \\ %{}) do
    Case.changeset(case, attrs)
  end
end
