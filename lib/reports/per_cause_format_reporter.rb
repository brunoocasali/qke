module Reports
  class PerCauseFormatReporter < Reports::Report
    def do_show!(game)
      {
        game['name'] => {
          kills_by_means: kills_as_array(game['kills'])
        }
      }
    end

    def kills_as_array(kills)
      result = {}

      kills.each do |kill|
        cause_id = kill['cause']

        result[Helpers::Constants::KILL_CAUSES[cause_id.to_i]] =
          kills.select { |e| e['cause'] == cause_id }.count
      end

      result
    end
  end
end
