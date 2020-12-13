# furimaテーブル設計

## usersテーブル

| Column             | Type        | Options                |
| ------------------ | ------- | -------------------------- |
| nickname           | string  | null: false, unique: true  |
| email              | string  | null: false                |
| encrypted_password | string  | null: false                |
| first_name         |string   | null: false                |
| fammily_name       | string  | null: false                |
| family_name_kana   | string  | null: false                |
| first_name_kana    | string  | null: false                |
| birth_day          | date    | null: false                |


### Association

- has_one :purchase_management
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

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
|postal_code                  | integer    | null: false                    |
|prefectures                  | string     | null: false                    |
|city                         | string     | null: false                    |
|adress                       | string     | null: false                    |
|building_name                | string     | null: false                    |
|phone_number                 | string     | null: false                    |
|purchase_management_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_management
- belongs_to :user 

## itemsテーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
|name              | string       | null: false                    |
|description       | text         | null: false                    |
|item_category_id  | string       | null: false                    |
|item_condition_id | string       | null: false                    |
|delivery_fee_id   | string       | null: false                    |
|delivery_area_id  | string       | null: false                    |
|delivery_day_id   | string       | null: false                    |
|price             | integer      | null: false                    |
|user_id           | references   | null: false, foreign_key: true |
 
### Association

- belongs_to :user 
- has_many :comments
- has_many :favorites
- has_one :purchase_management


## purchase_managementテーブル

| Column | Type         | Options                        |
| ------ | ------------ | ------------------------------ |
|user_id | references   | null: false, foreign_key: true |
|item_id | references   | null: false, foreign_key: true |

### Association

- has_one :user_adress
- belongs_to :item 
- belongs_to :users_adress





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
