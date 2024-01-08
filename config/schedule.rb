# frozen_string_literal: true

every 1.day, at: '1:00 am' do
  rake 'report:generate_daily_purchase_report'
end
