# furimaテーブル設計

## usersテーブル

| Column             | Type    | Options                    |
| ------------------ | ------- | -------------------------- |
| nickname           | string  | null: false, unique: true  |
| email              | string  | null: false                |
| encrypted_password | string  | null: false                |
| first_name         | string  | null: false                |
| family_name        | string  | null: false                |
| family_name_kana   | string  | null: false                |
| first_name_kana    | string  | null: false                |
| birth_day          | date    | null: false                |


### Association

- has_many :purchase_managements
- has_many :items






## user_addressesテーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
|postal_code                  | string     | null: false                    |
|delivery_area_id             | integer    | null: false                    |
|city                         | string     | null: false                    |
|adress                       | string     | null: false                    |
|building_name                | string     |                                |
|phone_number                 | string     | null: false                    |
|purchase_management          | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_management


## itemsテーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
|name              | string       | null: false                    |
|description       | text         | null: false                    |
|category_id       | integer      | null: false                    |
|condition_id      | integer      | null: false                    |
|delivery_fee_id   | integer      | null: false                    |
|delivery_area_id  | integer      | null: false                    |
|delivery_day_id   | integer      | null: false                    |
|price             | integer      | null: false                    |
|user              | references   | null: false, foreign_key: true |
 
### Association

- belongs_to :user 
- has_one :purchase_management


## purchase_managementテーブル

| Column | Type         | Options                        |
| ------ | ------------ | ------------------------------ |
|user    | references   | null: false, foreign_key: true |
|item    | references   | null: false, foreign_key: true |

### Association

- has_one :user_address
- belongs_to :item 
- belongs_to :user





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
