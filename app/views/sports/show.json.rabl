object @sport
attributes :id, :name

node :periods do |sport|
  sport.periods.map do |period|
    partial("periods/show", :object => period)
  end
end