# furimaテーブル設計

## usersテーブル

| Column         | Type    | Options      |
| -------------- | ------- | ------------ |
| nickname       | string  | null: false  |
| email          | string  | null: false  |
| password       | string  | null: false  |
| first_name     |string   | null: false  |
|fimily_name_kana|(string  | null: false  |
|first_name_kana |(string  | null: false  |
|birth_of_year   |(integer | null: false  |
|birth_of_month  |(integer | null: false  |
|birth_of_day    |(integer | null: false  |

### Association

- has_one :credit_card
- has_one :user_adress
- has_many :items
- has_many :comments
- has_many :favorites



## credit_cardテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
|customer_number  | integer    | null: false                    |
|expiration_month | integer    | null: false                    |
|expiration_year  | integer    | null: false                    |
|cvc              | integer    | null: false                    |
|user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user 


## users_adressテーブル

| Column       | Type        | Options                       |
| ------------ | ----------- | ----------------------------- |
|postal_code   | integer     | null: false                   |
|prefectures   | string     | null: false                    |
|city          | string     | null: false                    |
|adress        | string     | null: false                    |
|building_name | string     | null: false                    |
|phone_number  | integer    | null: false                    |
|user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user 

## itemsテーブル

| Column        | Type         | Options                        |
| ------------- | ------------ | ------------------------------ |
|name           | string       | null: false                    |
|description    | text         | null: false                    |
|item_category  | string       | null: false                    |
|item_condition | string       | null: false                    |
|delivery_fee   | string       | null: false                    |
|delivery_area  | string       | null: false                    |
|delivery_day   | string       | null: false                    |
|price          | integer      | null: false                    |
|user_id        | references   | null: false, foreign_key: true |

### Association

- belongs_to :user 
- has_many :comments
- has_many :favorites

## commentテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## favoriteテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
