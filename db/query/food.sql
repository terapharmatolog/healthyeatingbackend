-- name: CreateFood :one
INSERT INTO
    foods (product_name,
    calories,
    fats,
    proteins,
    carbohydrates,
    water,
    fiber,
    vitamin_A,
    beta_carotene,
    alpha_carotene,
    vitamin_D,
    vitamin_D3,
    vitamin_E,
    vitamin_K,
    vitamin_C,
    vitamin_B1,
    vitamin_B2,
    vitamin_B3,
    vitamin_B4,
    vitamin_B5,
    vitamin_B6,
    vitamin_B9,
    vitamin_B12,
    calcium,
    iron,
    magnesium,
    phosphorus,
    potassium,
    sodium,
    zinc,
    copper,
    manganese,
    selenium,
    fluorine)
VALUES
    (
        $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33,$34
    ) RETURNING *;

-- name: GetFood :one
SELECT * FROM foods
WHERE id = $1 LIMIT 1;

-- name: ListFoods :many
SELECT * FROM foods
ORDER BY id
LIMIT $1
OFFSET $2;


-- name: UpdateFood :exec
UPDATE foods
SET
    product_name = COALESCE($2, product_name),
    calories = COALESCE($3, calories),
    fats = COALESCE($4, fats),
    proteins = COALESCE($5, proteins),
    carbohydrates = COALESCE($6, carbohydrates),
    water = COALESCE($7, water),
    fiber = COALESCE($8, fiber),
    vitamin_A = COALESCE($9, vitamin_A),
    beta_carotene = COALESCE($10, beta_carotene),
    alpha_carotene = COALESCE($11, alpha_carotene),
    vitamin_D = COALESCE($12, vitamin_D),
    vitamin_D3 = COALESCE($13, vitamin_D3),
    vitamin_E = COALESCE($14, vitamin_E),
    vitamin_K = COALESCE($15, vitamin_K),
    vitamin_C = COALESCE($16, vitamin_C),
    vitamin_B1 = COALESCE($17, vitamin_B1),
    vitamin_B2 = COALESCE($18, vitamin_B2),
    vitamin_B3 = COALESCE($19, vitamin_B3),
    vitamin_B4 = COALESCE($20, vitamin_B4),
    vitamin_B5 = COALESCE($21, vitamin_B5),
    vitamin_B6 = COALESCE($22, vitamin_B6),
    vitamin_B9 = COALESCE($23, vitamin_B9),
    vitamin_B12 = COALESCE($24, vitamin_B12),
    calcium = COALESCE($25, calcium),
    iron = COALESCE($26, iron),
    magnesium = COALESCE($27, magnesium),
    phosphorus = COALESCE($28, phosphorus),
    potassium = COALESCE($29, potassium),
    sodium = COALESCE($30, sodium),
    zinc = COALESCE($31, zinc),
    copper = COALESCE($32, copper),
    manganese = COALESCE($33, manganese),
    selenium = COALESCE($34, selenium),
    fluorine = COALESCE($35, fluorine)
WHERE id = $1;

-- name: DeleteFood :exec
DELETE FROM foods WHERE id = $1;
