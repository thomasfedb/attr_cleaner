["4.2", "5.0"].each do |rails|
  appraise "rails-#{rails}" do
    gem "activerecord", "~> #{rails}", require: "active_record"
  end
end
