class CreateBenchmarkInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :benchmark_infos do |t|
      t.float :average_execution_time

      t.timestamps null: false
    end
  end
end