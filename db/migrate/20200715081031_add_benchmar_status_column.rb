class AddBenchmarStatusColumn < ActiveRecord::Migration[6.0]
  def change
		add_column :benchmark_infos, :benchmark_status, :string
  end
end
