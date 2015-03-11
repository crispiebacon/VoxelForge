doc = {}

doc.VERSION = {}
doc.VERSION.MAJOR = 0
doc.VERSION.MINOR = 1
doc.VERSION.PATCH = 0
doc.VERSION.STRING = "0.1.0"


doc.data = {}
doc.data.categories = {}
doc.data.players = {}

function doc.new_category(id, def)
	if doc.data.categories[id] == nil and id ~= nil then
		doc.data.categories[id] = {}
		doc.data.categories[id].entries = {}
		doc.data.categories[id].def = def
		return true
	else
		return false
	end
end

doc.new_category("one",
{
	name="One",
	build_formspec = function(data)
		return "label[0,1;Description: "..data.description.."]label[0,2;Time: "..data.time.."]"
	end,
}
)
doc.new_category("two", {name="Two"})
doc.new_category("three", {name="Three"})

function doc.new_entry(category_id, entry_id, def)
	if doc.data.categories[category_id] ~= nil then
		doc.data.categories[category_id].entries[entry_id] = def
		return true
	else
		return false
	end
end

doc.new_entry("one", "o1", {
	name="O1",
	data = {
		description = "This is a test description",
		time = 54,
		population = "10000000",
	},
})
doc.new_entry("one", "o2", {
	name="O2",
	data = {
		description = "This is a test description 2.",
		time = 100,
		population = "50000",
	},
})
doc.new_entry("one", "o3", {
	name="O3",
	data = {
		description = "Third try description.",
		time = 1,
		population = "10000000",
	},
})

function doc.show_doc(playername)
	local formspec = doc.formspec_core()..doc.formspec_main()
	minetest.show_formspec(playername, "doc:main", formspec)
end

function doc.formspec_core(tab)
	if tab == nil then tab = 1 else tab = tostring(tab) end
	return "size[12,9]tabheader[0,0;doc_header;Main,Category,Entry;"..tab..";true;false]"
end

function doc.formspec_main()
	local y = 1
	local formstring = "label[0,0;Available help topics:]"
	for id,data in pairs(doc.data.categories) do
		local button = "button[0,"..y..";3,1;doc_button_category_"..id..";"..data.def.name.."]"
		formstring = formstring .. button
		y = y + 1
	end
	return formstring
end

function doc.generate_entry_list(id, playername)
	local formstring
	if doc.data.players[playername].entry_textlist == nil then
		local entry_textlist = "textlist[0,1;11,7;doc_catlist;"
		local counter = 0
		doc.data.players[playername].entry_ids = {}
		for eid,entry in pairs(doc.data.categories[id].entries) do
			table.insert(doc.data.players[playername].entry_ids, eid)
			entry_textlist = entry_textlist .. entry.name .. ","
			counter = counter + 1
		end
		if counter >= 1  then
			entry_textlist = string.sub(entry_textlist, 1, #entry_textlist-1)
		end
		local catsel = doc.data.players[playername].catsel
		if catsel then
			entry_textlist = entry_textlist .. ";"..catsel
		end
		entry_textlist = entry_textlist .. "]"
		doc.data.players[playername].entry_textlist = entry_textlist
		formstring = entry_textlist
	else
		formstring = doc.data.players[playername].entry_textlist
	end
	return formstring
end

function doc.formspec_category(id, playername)
	local formstring
	if id == nil then
		formstring = "label[0,0;You haven't selected a help topic yet. Please select one in the category list first.]"
		formstring = formstring .. "button[0,1;3,1;doc_button_goto_main;Go to category list]"
	else
		formstring = "label[0,0;Current help topic: "..doc.data.categories[id].def.name.."]"
		formstring = formstring .. "label[0,0.5;Available entries:]"
		formstring = formstring .. doc.generate_entry_list(id, playername)
		formstring = formstring .. "button[0,8;3,1;doc_button_goto_entry;Show entry]"
	end
	return formstring
end

function doc.formspec_entry(category_id, entry_id)
	local formstring
	if category_id == nil then
		formstring = "label[0,0;You haven't selected a help topic yet. Please select one in the category list first.]"
		formstring = formstring .. "button[0,1;3,1;doc_button_goto_main;Go to category list]"
	elseif entry_id == nil then
		formstring = "label[0,0;You haven't selected an help entry yet. Please select one in the list of entries first.]"
		formstring = formstring .. "button[0,1;3,1;doc_button_goto_category;Go to entry list]"
	else
		local category = doc.data.categories[category_id]
		local entry = category.entries[entry_id]
		formstring = "label[0,0;Help > "..category.def.name.." > "..entry.name.."]"
		formstring = formstring .. category.def.build_formspec(entry.data)
	end
	return formstring
end

function doc.process_form(player,formname,fields)
	local playername = player:get_player_name()
	--[[ process clicks on the tab header ]]
	if(formname == "doc:main" or formname == "doc:category" or formname == "doc:entry") then
		if fields.doc_header ~= nil then
			local tab = tonumber(fields.doc_header)
			local formspec, subformname, contents
			if(tab==1) then
				contents = doc.formspec_main()
				subformname = "main"
			elseif(tab==2) then
				contents = doc.formspec_category(doc.data.players[playername].category, playername)
				subformname = "category"
			elseif(tab==3) then
				contents = doc.formspec_entry(doc.data.players[playername].category, doc.data.players[playername].entry)
				subformname = "entry"
			end
			formspec = doc.formspec_core(tab)..contents
			minetest.show_formspec(playername, "doc:" .. subformname, formspec)
			return
		end
	end
	if(formname == "doc:main") then
		for id,category in pairs(doc.data.categories) do
			if fields["doc_button_category_"..id] then
				local formspec = doc.formspec_core(2)..doc.formspec_category(id, playername)
				doc.data.players[playername].catsel = nil
				doc.data.players[playername].category = id
				minetest.show_formspec(playername, "doc:category", formspec)
				break
			end
		end
	elseif(formname == "doc:category") then
		if fields["doc_button_goto_entry"] then
			local cid = doc.data.players[playername].category
			if cid ~= nil then
				local eid = nil
				local eids, catsel = doc.data.players[playername].entry_ids, doc.data.players[playername].catsel
				if eids ~= nil and catsel ~= nil then
					eid = eids[catsel]
				end
				local formspec = doc.formspec_core(3)..doc.formspec_entry(cid, eid)
				minetest.show_formspec(playername, "doc:entry", formspec)
			end
		end
		if fields["doc_catlist"] then
			local event = minetest.explode_textlist_event(fields["doc_catlist"])
			if event.type == "CHG" then
				doc.data.players[playername].catsel = event.index
				doc.data.players[playername].entry = doc.data.players[playername].entry_ids[event.index]
			end
		end
	elseif(formname == "doc:entry") then

	end
end

minetest.register_on_player_receive_fields(doc.process_form)

minetest.register_chatcommand("doc", {
	params = "",
	description = "Show in-game documentation system.",
	privs = {},
	func = function(playername, param)
		doc.show_doc(playername)
	end,
	}
)

minetest.register_on_joinplayer(function(player)
	doc.data.players[player:get_player_name()] = {}
end)

minetest.register_on_leaveplayer(function(player)
	doc.data.players[player:get_player_name()] = nil
end)
