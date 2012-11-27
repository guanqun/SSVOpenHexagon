-- include useful files
execScript("utils.lua")
execScript("common.lua")
execScript("commonpatterns.lua")
execScript("alternativepatterns.lua")

-- this function adds a pattern to the timeline based on a key
function addPattern(mKey)
	if mKey == 0 then patternizer( {1,1,0,0,0,1,1,1,1,0,1,1,1,0,0,0,0,0,1,0,0,1,0,0,1,0,1,1,1,0,1,0,0,1,0,0,1,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0}, getPerfectThickness(THICKNESS))
	elseif mKey == 1 then patternizer( {1,0,0,0,0,1,1,0,0,0,0,1,1,1,0,0,1,1,1,1,0,0,1,1,1,1,1,0,1,1,1,1,0,0,1,1,1,1,0,1,1,1,1,1,0,0,1,1,1,1,1,0,1,1,0,0,0,0,0,0}, getPerfectThickness(THICKNESS))
	elseif mKey == 2 then patternizer( {0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,1,0,0,0,0,1,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0}, getPerfectThickness(THICKNESS))
	elseif mKey == 3 then patternizer( {1,1,0,1,1,1,1,0,0,1,1,1,1,0,1,1,1,1,1,0,0,0,1,1,1,1,1,0,0,1,1,1,1,1,0,1,1,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0}, getPerfectThickness(THICKNESS))
	elseif mKey == 4 then patternizer( {1,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,1,0,1,1,1,0,0,0,1,1,1,0,1,1,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0}, getPerfectThickness(THICKNESS))
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = { 0, 0, 1, 1, 2 }
keys = shuffle(keys)
index = 0

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
	log("level onLoad")
end

-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()
	log("level onStep")
	
	addPattern(keys[index])
	index = index + 1
	
	if index - 1 == table.getn(keys) then
		index = 1
	end
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()
	log("level onIncrement")	
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
	log("level onUnload")	
end
