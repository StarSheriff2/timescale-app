class ApplicationController < ActionController::Base
   around_action do |controller, action|
     performance = Benchmark.measure(&action.method(:call))


    PageLoad.create(path: request.path,
      performance: performance.real,
      user_agent: request.user_agent)
   end
end
