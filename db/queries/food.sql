-- name: CreateFood :one
INSERT INTO
    foods (product_name,calories,fats,
    proteins,carbohydrates, fiber, water, vitamin_A, beta_carotene,alpha_carotene,vitamin_D, vitamin_D3, vitamin_E,vitamin_K,vitamin_C,vitamin_B1,vitamin_B2,vitamin_B3,vitamin_B4,vitamin_B5,vitamin_B6,vitamin_B9,vitamin_B12,calcium,iron,magnesium,phosphorus,potassium,sodium,zinc,copper, manganese,selenium,fluorine )    
VALUES
    (
        $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33,$34
    ) RETURNING *;

-- name: GetFood :one
SELECT * FROM foods
WHERE id = $1 LIMIT 1;

-- name: ListFood :many
SELECT * FROM foods
ORDER BY id
LIMIT $1
OFFSET $2;


-- name: UpdateFood :exec
UPDATE foods SET product_name = $2
WHERE id = $1;

-- name: DeleteFood :exec
DELETE FROM foods WHERE id = $1;
