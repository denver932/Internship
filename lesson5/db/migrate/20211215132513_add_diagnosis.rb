class AddDiagnosis < ActiveRecord::Migration[6.1]
  def change
    change_table :physicians do |t|
      t.rename :name, :first_name
      t.string :last_name, null: false, default: ""
      t.string :phone, null: false, default: ""
      t.string :level, null: false, default: ""
    end

    change_table :patients do |t|
      t.rename :name, :first_name
      t.string :last_name, null: false, default: ""
      t.integer :age, null: false, default: 1
      t.string :email, null: false, default: ""
    end

    create_table :diagnosis_items do |t|
      t.string :content, null: false, default: ""
      t.belongs_to :physician
      t.belongs_to :patient
      t.timestamps
    end

    change_column_null :patients, :first_name, false
    change_column_default :patients, :first_name, from: nil, to: ""
    change_column_null :physicians, :first_name, false
    change_column_default :physicians, :first_name, from: nil, to: ""
  end
end

