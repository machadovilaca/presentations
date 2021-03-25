defmodule Wld.LawyersTest do
  use Wld.DataCase

  alias Wld.Lawyers

  describe "lawyers" do
    alias Wld.Lawyers.Lawyer

    @valid_attrs %{birthday: ~D[2010-04-17], first_name: "some first_name", last_name: "some last_name", lawyer_id: "some lawyer_id"}
    @update_attrs %{birthday: ~D[2011-05-18], first_name: "some updated first_name", last_name: "some updated last_name", lawyer_id: "some updated lawyer_id"}
    @invalid_attrs %{birthday: nil, first_name: nil, last_name: nil, lawyer_id: nil}

    def lawyer_fixture(attrs \\ %{}) do
      {:ok, lawyer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lawyers.create_lawyer()

      lawyer
    end

    test "list_lawyers/0 returns all lawyers" do
      lawyer = lawyer_fixture()
      assert Lawyers.list_lawyers() == [lawyer]
    end

    test "get_lawyer!/1 returns the lawyer with given id" do
      lawyer = lawyer_fixture()
      assert Lawyers.get_lawyer!(lawyer.id) == lawyer
    end

    test "create_lawyer/1 with valid data creates a lawyer" do
      assert {:ok, %Lawyer{} = lawyer} = Lawyers.create_lawyer(@valid_attrs)
      assert lawyer.birthday == ~D[2010-04-17]
      assert lawyer.first_name == "some first_name"
      assert lawyer.last_name == "some last_name"
      assert lawyer.lawyer_id == "some lawyer_id"
    end

    test "create_lawyer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lawyers.create_lawyer(@invalid_attrs)
    end

    test "update_lawyer/2 with valid data updates the lawyer" do
      lawyer = lawyer_fixture()
      assert {:ok, %Lawyer{} = lawyer} = Lawyers.update_lawyer(lawyer, @update_attrs)
      assert lawyer.birthday == ~D[2011-05-18]
      assert lawyer.first_name == "some updated first_name"
      assert lawyer.last_name == "some updated last_name"
      assert lawyer.lawyer_id == "some updated lawyer_id"
    end

    test "update_lawyer/2 with invalid data returns error changeset" do
      lawyer = lawyer_fixture()
      assert {:error, %Ecto.Changeset{}} = Lawyers.update_lawyer(lawyer, @invalid_attrs)
      assert lawyer == Lawyers.get_lawyer!(lawyer.id)
    end

    test "delete_lawyer/1 deletes the lawyer" do
      lawyer = lawyer_fixture()
      assert {:ok, %Lawyer{}} = Lawyers.delete_lawyer(lawyer)
      assert_raise Ecto.NoResultsError, fn -> Lawyers.get_lawyer!(lawyer.id) end
    end

    test "change_lawyer/1 returns a lawyer changeset" do
      lawyer = lawyer_fixture()
      assert %Ecto.Changeset{} = Lawyers.change_lawyer(lawyer)
    end
  end

  describe "lawyers" do
    alias Wld.Lawyers.Lawyer

    @valid_attrs %{birthday: ~D[2010-04-17], first_name: "some first_name", last_name: "some last_name"}
    @update_attrs %{birthday: ~D[2011-05-18], first_name: "some updated first_name", last_name: "some updated last_name"}
    @invalid_attrs %{birthday: nil, first_name: nil, last_name: nil}

    def lawyer_fixture(attrs \\ %{}) do
      {:ok, lawyer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lawyers.create_lawyer()

      lawyer
    end

    test "list_lawyers/0 returns all lawyers" do
      lawyer = lawyer_fixture()
      assert Lawyers.list_lawyers() == [lawyer]
    end

    test "get_lawyer!/1 returns the lawyer with given id" do
      lawyer = lawyer_fixture()
      assert Lawyers.get_lawyer!(lawyer.id) == lawyer
    end

    test "create_lawyer/1 with valid data creates a lawyer" do
      assert {:ok, %Lawyer{} = lawyer} = Lawyers.create_lawyer(@valid_attrs)
      assert lawyer.birthday == ~D[2010-04-17]
      assert lawyer.first_name == "some first_name"
      assert lawyer.last_name == "some last_name"
    end

    test "create_lawyer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lawyers.create_lawyer(@invalid_attrs)
    end

    test "update_lawyer/2 with valid data updates the lawyer" do
      lawyer = lawyer_fixture()
      assert {:ok, %Lawyer{} = lawyer} = Lawyers.update_lawyer(lawyer, @update_attrs)
      assert lawyer.birthday == ~D[2011-05-18]
      assert lawyer.first_name == "some updated first_name"
      assert lawyer.last_name == "some updated last_name"
    end

    test "update_lawyer/2 with invalid data returns error changeset" do
      lawyer = lawyer_fixture()
      assert {:error, %Ecto.Changeset{}} = Lawyers.update_lawyer(lawyer, @invalid_attrs)
      assert lawyer == Lawyers.get_lawyer!(lawyer.id)
    end

    test "delete_lawyer/1 deletes the lawyer" do
      lawyer = lawyer_fixture()
      assert {:ok, %Lawyer{}} = Lawyers.delete_lawyer(lawyer)
      assert_raise Ecto.NoResultsError, fn -> Lawyers.get_lawyer!(lawyer.id) end
    end

    test "change_lawyer/1 returns a lawyer changeset" do
      lawyer = lawyer_fixture()
      assert %Ecto.Changeset{} = Lawyers.change_lawyer(lawyer)
    end
  end
end
