class CreateCallbackRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :callback_requests do |t|
      t.references :homeowner_insurance, null: false, foreign_key: true
      t.string :phone, null: false
      t.integer :best_moment, null: false
      t.boolean :reason_has_questions
      t.boolean :reason_prefer_to_complete_by_phone
      t.boolean :reason_other

      t.timestamps
    end
  end
end
