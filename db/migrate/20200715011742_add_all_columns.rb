class AddAllColumns < ActiveRecord::Migration[6.0]
  def change
		add_column :benchmark_infos, :file_name, :string
		add_column :benchmark_infos, :error_message, :string
		add_column :benchmark_infos, :median_execution_time, :float
		add_column :benchmark_infos, :min_execution_time, :float
		add_column :benchmark_infos, :max_execution_time, :float
  end
end