class ApiConstraints
  def initialize(opts)
    @version = opts[:version]
    @default = opts[:default]
  end

  def matches?(req)
    @default || req.headers["Accept"].include?("application/vnd.shakenxstirred.v#{@version}")
  end
end
