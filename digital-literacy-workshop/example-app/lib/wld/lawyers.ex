defmodule Wld.Lawyers do
  @moduledoc """
  The Lawyers context.
  """

  import Ecto.Query, warn: false
  alias Wld.Repo

  alias Wld.Lawyers.Lawyer

  @doc """
  Returns the list of lawyers.

  ## Examples

      iex> list_lawyers()
      [%Lawyer{}, ...]

  """
  def list_lawyers do
    Repo.all(Lawyer)
  end

  @doc """
  Gets a single lawyer.

  Raises `Ecto.NoResultsError` if the Lawyer does not exist.

  ## Examples

      iex> get_lawyer!(123)
      %Lawyer{}

      iex> get_lawyer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lawyer!(id) do
    Repo.get!(Lawyer, id)
    |> Repo.preload(:practice_areas)
  end

  @doc """
  Creates a lawyer.

  ## Examples

      iex> create_lawyer(%{field: value})
      {:ok, %Lawyer{}}

      iex> create_lawyer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lawyer(attrs \\ %{}) do
    %Lawyer{}
    |> Lawyer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lawyer.

  ## Examples

      iex> update_lawyer(lawyer, %{field: new_value})
      {:ok, %Lawyer{}}

      iex> update_lawyer(lawyer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lawyer(%Lawyer{} = lawyer, attrs) do
    lawyer
    |> Lawyer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a lawyer.

  ## Examples

      iex> delete_lawyer(lawyer)
      {:ok, %Lawyer{}}

      iex> delete_lawyer(lawyer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lawyer(%Lawyer{} = lawyer) do
    Repo.delete(lawyer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lawyer changes.

  ## Examples

      iex> change_lawyer(lawyer)
      %Ecto.Changeset{data: %Lawyer{}}

  """
  def change_lawyer(%Lawyer{} = lawyer, attrs \\ %{}) do
    Lawyer.changeset(lawyer, attrs)
  end
end
