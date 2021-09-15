timer.Simple(0.1, function() resource.AddWorkshopCollection("workshopid") end)

function resource.AddWorkshopCollection( id )


    local count = 0
    local files = {}
    
	http.Fetch( "http://steamcommunity.com/sharedfiles/filedetails/?id=" .. id, function( page )	

        
	
		for k in page:gmatch( [[<div id="sharedfile_(.-)" class="collectionItem">]] ) do
			resource.AddWorkshop( k )
            count = count + 1
            
            --Generator
            
            local files2 = "resource.AddWorkshop("..'"'..k..'"'..")"
            
            table.insert(files, files2)            
            
            
		end
        
        
            local fileNames = table.concat(files, "\n")
		
            print(fileNames)
            file.Write( "WorkshopGenerator.txt", fileNames )
            print("Workshop Files are: "..count)
        
	end )
end
