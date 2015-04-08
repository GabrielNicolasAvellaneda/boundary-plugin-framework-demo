local framework = require('framework')
local PollingPlugin = framework.PollingPlugin
local RandomDataSource = framework.RandomDataSource

local params = framework.params
params.name = 'LUA demo plugin'
params.version = '1.0'
params.minValue = params.minValue or 1
params.maxValue = params.maxValue or 100

local dataSource = RandomDataSource:new(params.minValue, params.maxValue)
local plugin = PollingPlugin:new(params, dataSource)
function plugin:onParseValues(data)
	local result = {}
	result['BOUNDARY_LUA_SAMPLE'] = tonumber(data)

	return result 
end

plugin:run()
