# Лабораторная работа №1

| Вариант | Описание |
|---|---|
| 1 | Интернет-магазин |


## Задание
Условие лабораторной работы можно прочитать [здесь](task_1.pdf)

## ER-диаграмма исходной модели

~~~mermaid
erDiagram
    CUSTOMERS ||--o{ ORDERS : "1 : N"
    CATEGORIES ||--o{ PRODUCTS : "1 : N"
    ORDERS ||--o{ ORDER_ITEMS : "1 : N"
    PRODUCTS ||--o{ ORDER_ITEMS : "1 : N"
    PRODUCTS ||--o{ PRICE_HISTORY : "1 : N"
~~~

## Состав проекта

~~~text
lab-1/
├── README.md
├── БД ЛР 1 2026.pdf
└── solution/
    ├── schema.sql           # схема
    ├── data.sql             # тестовые данные
    ├── constraints_test.sql # проверка ограничений
    └── migration.sql        # дополнительное изменение структуры
~~~