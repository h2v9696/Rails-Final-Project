class CreateDatabaseStructure < ActiveRecord::Migration[5.1]
  def change
    create_table :database_structures do |t|
    end
  end

  class << self
    def up
      ActiveRecord::Schema.define(version: 0) do

        create_table "comments", primary_key: "comment_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
          t.integer "comment_user_id"
          t.integer "comment_product_id", null: false
          t.string "comment", limit: 400, null: false, collation: "utf8_general_ci"
          t.datetime "comment_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
          t.index ["comment_product_id"], name: "fk_Comments_2_idx"
          t.index ["comment_user_id"], name: "fk_Comments_1_idx"
        end

        create_table "order_details", primary_key: "detail_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
          t.integer "detail_order_id", null: false
          t.integer "detail_product_id", null: false
          t.string "detail_name", limit: 250, null: false
          t.float "detail_price", limit: 24, null: false
          t.string "detail_sku", limit: 50, null: false
          t.integer "detail_quantity", null: false
          t.index ["detail_order_id"], name: "fk_orderdetails_2_idx"
          t.index ["detail_product_id"], name: "fk_orderdetails_1_idx"
        end

        create_table "orders", primary_key: "order_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
          t.integer "order_user_id", null: false
          t.float "order_amount", limit: 24, null: false
          t.string "order_ship_name", limit: 100, null: false
          t.string "order_ship_address", limit: 100, null: false
          t.string "order_city", limit: 50, null: false
          t.string "order_zip", limit: 20, null: false
          t.string "order_country", limit: 50, null: false
          t.string "order_phone", limit: 20, null: false
          t.string "order_fax", limit: 20
          t.float "order_shipping", limit: 24, null: false
          t.float "order_tax", limit: 24, null: false
          t.string "order_email", limit: 100, null: false
          t.timestamp "order_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
          t.boolean "order_shipped", default: false, null: false
          t.string "order_tracking_number", limit: 80
          t.index ["order_user_id"], name: "fk_orders_1_idx"
        end

        create_table "product_categories", primary_key: "category_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
          t.string "category_name", limit: 50, null: false
        end

        create_table "product_images", primary_key: "image_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
          t.integer "image_product_id", null: false
          t.string "image", limit: 45, null: false, collation: "utf8_general_ci"
          t.index ["image_product_id"], name: "fk_productimages_1_idx"
        end

        create_table "products", primary_key: "product_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
          t.string "product_sku", limit: 50, null: false
          t.string "product_name", limit: 500, collation: "utf8mb4_unicode_ci"
          t.text "product_description", collation: "utf8mb4_unicode_ci"
          t.string "product_manufacturer", limit: 50, null: false
          t.float "product_price", limit: 24, null: false
          t.float "product_weight", limit: 24, null: false
          t.integer "product_category_id"
          t.timestamp "product_update_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
          t.integer "product_quantity", default: 1000, null: false
          t.index ["product_category_id"], name: "index2"
        end

        create_table "users", primary_key: "user_id", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
          t.string "user_email", limit: 500
          t.string "user_password", limit: 500
          t.string "user_first_name", limit: 50
          t.string "user_last_name", limit: 50
          t.string "user_city", limit: 90
          t.boolean "user_email_verified", default: false
          t.timestamp "user_registration_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
          t.string "user_phone", limit: 20
          t.string "user_country", limit: 20
          t.string "user_address", limit: 100
          t.string "user_zip", limit: 45
          t.string "user_fax", limit: 45
        end
      end
    end
  end
end
