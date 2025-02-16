package db

import (
	"context"
	"math/big"
	"testing"

	"github.com/jackc/pgx/v5/pgtype"
	"github.com/stretchr/testify/require"
)

func TestCreateFood(t *testing.T) {
	// Arrange
	arg := CreateFoodParams{
		ProductName:   "Apple",
		Calories:      pgtype.Numeric{Int: big.NewInt(95), Valid: true}, // Используем big.NewInt
		Fats:          pgtype.Numeric{Int: big.NewInt(0), Valid: true},  // Используем big.NewInt
		Proteins:      pgtype.Numeric{Int: big.NewInt(0), Valid: true},  // Используем big.NewInt
		Carbohydrates: pgtype.Numeric{Int: big.NewInt(25), Valid: true}, // Используем big.NewInt
		Water:         pgtype.Numeric{Int: big.NewInt(85), Valid: true}, // Используем big.NewInt
		Fiber:         pgtype.Numeric{Int: big.NewInt(4), Valid: true},  // Используем big.NewInt
		VitaminA:      pgtype.Numeric{Int: big.NewInt(2), Valid: true},  // Используем big.NewInt
	}

	// Act
	food, err := testQueries.CreateFood(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, food.ID)
	require.Equal(t, arg.ProductName, food.ProductName)
	require.Equal(t, arg.Calories, food.Calories)
	require.Equal(t, arg.Fats, food.Fats)
	require.Equal(t, arg.Proteins, food.Proteins)
	require.Equal(t, arg.Carbohydrates, food.Carbohydrates)
	require.Equal(t, arg.Water, food.Water)
	require.Equal(t, arg.Fiber, food.Fiber)
	require.Equal(t, arg.VitaminA, food.VitaminA)

	require.NotZero(t, food.ID)
	require.NotZero(t, food.CreatedAt)
}

func TestDeleteFood(t *testing.T) {
	// Arrange
	arg := CreateFoodParams{
		ProductName:   "Apple",
		Calories:      pgtype.Numeric{Int: big.NewInt(95), Valid: true},
		Fats:          pgtype.Numeric{Int: big.NewInt(0), Valid: true},
		Proteins:      pgtype.Numeric{Int: big.NewInt(0), Valid: true},
		Carbohydrates: pgtype.Numeric{Int: big.NewInt(25), Valid: true},
		Water:         pgtype.Numeric{Int: big.NewInt(85), Valid: true},
		Fiber:         pgtype.Numeric{Int: big.NewInt(4), Valid: true},
		VitaminA:      pgtype.Numeric{Int: big.NewInt(2), Valid: true},
	}

	// Создание продукта
	food, err := testQueries.CreateFood(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, food.ID)

	// Act
	err = testQueries.DeleteFood(context.Background(), food.ID)
	require.NoError(t, err)

	// Попытка получить удалённый продукт
	_, err = testQueries.GetFood(context.Background(), food.ID)
	require.Error(t, err)
}

func TestListFoods(t *testing.T) {
	// Arrange
	limit, offset := int32(5), int32(0)

	// Act
	foods, err := testQueries.ListFoods(context.Background(), limit, offset)
	require.NoError(t, err)
	require.NotEmpty(t, foods)
	require.Len(t, foods, 5)
}

func TestGetFood(t *testing.T) {
	// Arrange
	arg := CreateFoodParams{
		ProductName:   "Apple",
		Calories:      pgtype.Numeric{Int: big.NewInt(95), Valid: true},
		Fats:          pgtype.Numeric{Int: big.NewInt(0), Valid: true},
		Proteins:      pgtype.Numeric{Int: big.NewInt(0), Valid: true},
		Carbohydrates: pgtype.Numeric{Int: big.NewInt(25), Valid: true},
		Water:         pgtype.Numeric{Int: big.NewInt(85), Valid: true},
		Fiber:         pgtype.Numeric{Int: big.NewInt(4), Valid: true},
		VitaminA:      pgtype.Numeric{Int: big.NewInt(2), Valid: true},
	}

	// Создание продукта
	food, err := testQueries.CreateFood(context.Background(), arg)
	require.NoError(t, err)

	// Act
	gotFood, err := testQueries.GetFood(context.Background(), food.ID)
	require.NoError(t, err)

	// Assert
	require.Equal(t, food.ID, gotFood.ID)
	require.Equal(t, food.ProductName, gotFood.ProductName)
	require.Equal(t, food.Calories, gotFood.Calories)
	require.Equal(t, food.Fats, gotFood.Fats)
	require.Equal(t, food.Proteins, gotFood.Proteins)
	require.Equal(t, food.Carbohydrates, gotFood.Carbohydrates)
	require.Equal(t, food.Water, gotFood.Water)
	require.Equal(t, food.Fiber, gotFood.Fiber)
	require.Equal(t, food.VitaminA, gotFood.VitaminA)
}

func TestUpdateFood(t *testing.T) {
	// Arrange
	arg := CreateFoodParams{
		ProductName:   "Apple",
		Calories:      pgtype.Numeric{Int: big.NewInt(95), Valid: true},
		Fats:          pgtype.Numeric{Int: big.NewInt(0), Valid: true},
		Proteins:      pgtype.Numeric{Int: big.NewInt(0), Valid: true},
		Carbohydrates: pgtype.Numeric{Int: big.NewInt(25), Valid: true},
		Water:         pgtype.Numeric{Int: big.NewInt(85), Valid: true},
		Fiber:         pgtype.Numeric{Int: big.NewInt(4), Valid: true},
		VitaminA:      pgtype.Numeric{Int: big.NewInt(2), Valid: true},
	}

	// Создание продукта
	food, err := testQueries.CreateFood(context.Background(), arg)
	require.NoError(t, err)

	// Новый продукт
	newProductName := "Banana"
	newCalories := pgtype.Numeric{Int: big.NewInt(100), Valid: true}

	// Act
	err = testQueries.UpdateFood(context.Background(), food.ID, newProductName, newCalories)
	require.NoError(t, err)

	// Получение обновленного продукта
	updatedFood, err := testQueries.GetFood(context.Background(), food.ID)
	require.NoError(t, err)

	// Assert
	require.Equal(t, newProductName, updatedFood.ProductName)
	require.Equal(t, newCalories, updatedFood.Calories)
}
