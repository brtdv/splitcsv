require "splitcsv/version"

module SplitCSV
  class SplitCSV
    def split(file, maxlength=5000, separator=';')
      csv_basename     = File.basename(file, ".*")
      csv_path         = File.expand_path(file)
      csv_dir          = File.dirname(csv_path)

      csv_file         = CSV.open(file, :row_sep => :auto, :col_sep => separator)
      csv_length       = csv_file.readlines.size

      # Opnieuw inlezen zodat readline pointer terug aan 0 staat. Na gebruiken van
      # csv_file.readlines.size werd "csv_file" al eens volledig doorlopen
      csv_file         = CSV.open(file, :row_sep => :auto, :col_sep => separator)
      firstline        = csv_file.readline

      for i in 0..((csv_length / maxlength.to_i).ceil) do
        CSV.open("#{csv_dir}/#{csv_basename}_#{i+1}.csv", 'w', :row_sep => :auto, :col_sep => separator) do |csv|
          csv << firstline

          for j in 1..csv_maxlength do
            if (line = csv_file.readline) != nil
              csv << line
            end
          end
        end
      end
    end
  end
end
