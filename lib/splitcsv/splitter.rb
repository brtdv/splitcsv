require 'CSV'

module SplitCSV
  class Splitter
    def split(file, maxlength=5000, separator=';')
      csv_basename = File.basename(file, ".*")
      csv_path     = File.expand_path(file)
      csv_dir      = File.dirname(csv_path)

      csv_obj      = CSV.open(csv_path, :row_sep => :auto, :col_sep => separator)
      csv_length   = csv_obj.readlines.size

      # Opnieuw inlezen zodat readline pointer terug aan 0 staat. Na gebruiken van
      # csv_obj.readlines.size werd "csv_obj" al eens volledig doorlopen
      csv_obj      = CSV.open(csv_path, :row_sep => :auto, :col_sep => separator)
      firstline    = csv_obj.readline

      for i in 0..((csv_length / maxlength.to_i).ceil) do
        CSV.open("#{csv_dir}/#{csv_basename}_#{i+1}.csv", 'w', :row_sep => :auto, :col_sep => separator) do |csv|
          csv << firstline

          for j in 0..maxlength.to_i do
            if (line = csv_obj.readline) != nil
              csv << line
            end
          end
        end
      end
    end
  end
end
