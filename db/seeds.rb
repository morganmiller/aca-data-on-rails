ActiveRecord::Schema.define do
  create_table :plans do |t|
    t.string :state
    t.integer :child_premium
    t.string :plan_type
    t.integer :premium_adult_21_years
    t.integer :indv_medical_deductible #make different data type - needs to be int
  end
end

root_dir      = File.expand_path '../', __dir__
data_filepath = "#{root_dir}/tmp/data.json"
data = JSON.parse File.read(data_filepath)

column_map = data["meta"]["view"]["columns"]
               .reject { |c| c["id"] == -1 }
               .map { |c| [c["name"], c["id"].to_s] }
               .to_h

data["data"].each do |column|
  attributes = {
    state:                    column[column_map["State"]],
    child_premium:            column[column_map["Premium Child"]],
    plan_type:                column[column_map["Plan Type"]],
    premium_adult_21_years:   column[column_map["Premium Adult Individual Age 21"]],
    indv_medical_deductible:  column[column_map["Medical Deductible - individual - standard"]].delete("$,").to_i
  }
  Plan.find_by(attributes) || Plan.create!(attributes)
end
