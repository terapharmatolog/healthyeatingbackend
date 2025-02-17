-- Создание таблицы food
CREATE TABLE foods (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL UNIQUE, -- Название продукта
    calories INT NOT NULL DEFAULT 0, -- Калорийность (ккал на 100 г)
    fats DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Жиры (г на 100 г)
    proteins DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Белки (г на 100 г)
    carbohydrates DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Углеводы (г на 100 г)
    fiber DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Волокна (г на 100 г)
    water DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Вода (г на 100 г)
    vitamin_A DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин A (мкг на 100 г)
    beta_carotene DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Бета-каротин (мкг на 100 г)
    alpha_carotene DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Альфа-каротин (мкг на 100 г)
    vitamin_D DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин D (мкг на 100 г)
    vitamin_D3 DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин D3 (мкг на 100 г)
    vitamin_E DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин E (мг на 100 г)
    vitamin_K DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин K (мкг на 100 г)
    vitamin_C DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин C (мг на 100 г)
    vitamin_B1 DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин B1 (мг на 100 г)
    vitamin_B2 DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин B2 (мг на 100 г)
    vitamin_B3 DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин B3 (мг на 100 г)
    vitamin_B4 DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин B4 (мг на 100 г)
    vitamin_B5 DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин B5 (мг на 100 г)
    vitamin_B6 DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин B6 (мг на 100 г)
    vitamin_B9 DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин B9 (мкг на 100 г)
    vitamin_B12 DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Витамин B12 (мкг на 100 г)
    calcium DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Кальций (мг на 100 г)
    iron DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Железо (мг на 100 г)
    magnesium DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Магний (мг на 100 г)
    phosphorus DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Фосфор (мг на 100 г)
    potassium DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Калий (мг на 100 г)
    sodium DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Натрий (мг на 100 г)
    zinc DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Цинк (мг на 100 г)
    copper DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Медь (мг на 100 г)
    manganese DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Марганец (мг на 100 г)
    selenium DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Селен (мкг на 100 г)
    fluorine DECIMAL(6, 2) NOT NULL DEFAULT 0, -- Фтор (мкг на 100 г)
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP -- Дата добавления продукта
);

-- Индексы
CREATE INDEX idx_foods_calories ON foods (calories);

CREATE INDEX idx_foods_macros ON foods (proteins, fats, carbohydrates);

-- Комментарии
COMMENT ON TABLE foods IS 'Таблица с базовой информацией о продуктах и их пищевой ценности (данные указаны на 100 г продукта)';

COMMENT ON COLUMN foods.product_name IS 'Название продукта';

COMMENT ON COLUMN foods.calories IS 'Калорийность (ккал на 100 г)';

COMMENT ON COLUMN foods.fats IS 'Жиры (г на 100 г)';

COMMENT ON COLUMN foods.proteins IS 'Белки (г на 100 г)';

COMMENT ON COLUMN foods.carbohydrates IS 'Углеводы (г на 100 г)';

COMMENT ON COLUMN foods.created_at IS 'Дата добавления продукта';