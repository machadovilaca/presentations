defmodule Wld.CourtsTest do
  use Wld.DataCase

  alias Wld.Courts

  describe "practice_areas" do
    alias Wld.Courts.PracticeArea

    @valid_attrs %{name: "some name", practice_area_id: "some practice_area_id"}
    @update_attrs %{name: "some updated name", practice_area_id: "some updated practice_area_id"}
    @invalid_attrs %{name: nil, practice_area_id: nil}

    def practice_area_fixture(attrs \\ %{}) do
      {:ok, practice_area} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courts.create_practice_area()

      practice_area
    end

    test "list_practice_areas/0 returns all practice_areas" do
      practice_area = practice_area_fixture()
      assert Courts.list_practice_areas() == [practice_area]
    end

    test "get_practice_area!/1 returns the practice_area with given id" do
      practice_area = practice_area_fixture()
      assert Courts.get_practice_area!(practice_area.id) == practice_area
    end

    test "create_practice_area/1 with valid data creates a practice_area" do
      assert {:ok, %PracticeArea{} = practice_area} = Courts.create_practice_area(@valid_attrs)
      assert practice_area.name == "some name"
      assert practice_area.practice_area_id == "some practice_area_id"
    end

    test "create_practice_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courts.create_practice_area(@invalid_attrs)
    end

    test "update_practice_area/2 with valid data updates the practice_area" do
      practice_area = practice_area_fixture()
      assert {:ok, %PracticeArea{} = practice_area} = Courts.update_practice_area(practice_area, @update_attrs)
      assert practice_area.name == "some updated name"
      assert practice_area.practice_area_id == "some updated practice_area_id"
    end

    test "update_practice_area/2 with invalid data returns error changeset" do
      practice_area = practice_area_fixture()
      assert {:error, %Ecto.Changeset{}} = Courts.update_practice_area(practice_area, @invalid_attrs)
      assert practice_area == Courts.get_practice_area!(practice_area.id)
    end

    test "delete_practice_area/1 deletes the practice_area" do
      practice_area = practice_area_fixture()
      assert {:ok, %PracticeArea{}} = Courts.delete_practice_area(practice_area)
      assert_raise Ecto.NoResultsError, fn -> Courts.get_practice_area!(practice_area.id) end
    end

    test "change_practice_area/1 returns a practice_area changeset" do
      practice_area = practice_area_fixture()
      assert %Ecto.Changeset{} = Courts.change_practice_area(practice_area)
    end
  end

  describe "cases" do
    alias Wld.Courts.Case

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def case_fixture(attrs \\ %{}) do
      {:ok, case} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courts.create_case()

      case
    end

    test "list_cases/0 returns all cases" do
      case = case_fixture()
      assert Courts.list_cases() == [case]
    end

    test "get_case!/1 returns the case with given id" do
      case = case_fixture()
      assert Courts.get_case!(case.id) == case
    end

    test "create_case/1 with valid data creates a case" do
      assert {:ok, %Case{} = case} = Courts.create_case(@valid_attrs)
    end

    test "create_case/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courts.create_case(@invalid_attrs)
    end

    test "update_case/2 with valid data updates the case" do
      case = case_fixture()
      assert {:ok, %Case{} = case} = Courts.update_case(case, @update_attrs)
    end

    test "update_case/2 with invalid data returns error changeset" do
      case = case_fixture()
      assert {:error, %Ecto.Changeset{}} = Courts.update_case(case, @invalid_attrs)
      assert case == Courts.get_case!(case.id)
    end

    test "delete_case/1 deletes the case" do
      case = case_fixture()
      assert {:ok, %Case{}} = Courts.delete_case(case)
      assert_raise Ecto.NoResultsError, fn -> Courts.get_case!(case.id) end
    end

    test "change_case/1 returns a case changeset" do
      case = case_fixture()
      assert %Ecto.Changeset{} = Courts.change_case(case)
    end
  end

  describe "cases" do
    alias Wld.Courts.Case

    @valid_attrs %{details: "some details"}
    @update_attrs %{details: "some updated details"}
    @invalid_attrs %{details: nil}

    def case_fixture(attrs \\ %{}) do
      {:ok, case} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courts.create_case()

      case
    end

    test "list_cases/0 returns all cases" do
      case = case_fixture()
      assert Courts.list_cases() == [case]
    end

    test "get_case!/1 returns the case with given id" do
      case = case_fixture()
      assert Courts.get_case!(case.id) == case
    end

    test "create_case/1 with valid data creates a case" do
      assert {:ok, %Case{} = case} = Courts.create_case(@valid_attrs)
      assert case.details == "some details"
    end

    test "create_case/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courts.create_case(@invalid_attrs)
    end

    test "update_case/2 with valid data updates the case" do
      case = case_fixture()
      assert {:ok, %Case{} = case} = Courts.update_case(case, @update_attrs)
      assert case.details == "some updated details"
    end

    test "update_case/2 with invalid data returns error changeset" do
      case = case_fixture()
      assert {:error, %Ecto.Changeset{}} = Courts.update_case(case, @invalid_attrs)
      assert case == Courts.get_case!(case.id)
    end

    test "delete_case/1 deletes the case" do
      case = case_fixture()
      assert {:ok, %Case{}} = Courts.delete_case(case)
      assert_raise Ecto.NoResultsError, fn -> Courts.get_case!(case.id) end
    end

    test "change_case/1 returns a case changeset" do
      case = case_fixture()
      assert %Ecto.Changeset{} = Courts.change_case(case)
    end
  end

  describe "practice_areas" do
    alias Wld.Courts.PracticeArea

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def practice_area_fixture(attrs \\ %{}) do
      {:ok, practice_area} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courts.create_practice_area()

      practice_area
    end

    test "list_practice_areas/0 returns all practice_areas" do
      practice_area = practice_area_fixture()
      assert Courts.list_practice_areas() == [practice_area]
    end

    test "get_practice_area!/1 returns the practice_area with given id" do
      practice_area = practice_area_fixture()
      assert Courts.get_practice_area!(practice_area.id) == practice_area
    end

    test "create_practice_area/1 with valid data creates a practice_area" do
      assert {:ok, %PracticeArea{} = practice_area} = Courts.create_practice_area(@valid_attrs)
      assert practice_area.name == "some name"
    end

    test "create_practice_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courts.create_practice_area(@invalid_attrs)
    end

    test "update_practice_area/2 with valid data updates the practice_area" do
      practice_area = practice_area_fixture()
      assert {:ok, %PracticeArea{} = practice_area} = Courts.update_practice_area(practice_area, @update_attrs)
      assert practice_area.name == "some updated name"
    end

    test "update_practice_area/2 with invalid data returns error changeset" do
      practice_area = practice_area_fixture()
      assert {:error, %Ecto.Changeset{}} = Courts.update_practice_area(practice_area, @invalid_attrs)
      assert practice_area == Courts.get_practice_area!(practice_area.id)
    end

    test "delete_practice_area/1 deletes the practice_area" do
      practice_area = practice_area_fixture()
      assert {:ok, %PracticeArea{}} = Courts.delete_practice_area(practice_area)
      assert_raise Ecto.NoResultsError, fn -> Courts.get_practice_area!(practice_area.id) end
    end

    test "change_practice_area/1 returns a practice_area changeset" do
      practice_area = practice_area_fixture()
      assert %Ecto.Changeset{} = Courts.change_practice_area(practice_area)
    end
  end
end
