-- This is just an example on the server side, you could make this client side by replacing TriggerClientEvent('licenses:showToClosest', source, data) with ShowToClosest(data)

RegisterCommand("showid", function(source, args, rawCommand)
    if (source > 0) then
        local data = {
            FirstName = "Robert",
            LastName = "Williams",
            DOB = "1997/10/02",
            Issue = "02/27/22",
            CitizenID = "26",
            Sex = "Male",
            Hair = "brown",
            Height = "180cm",
            Eyes = "blue",
            Image = "images/placeholder.png",
            Format = "id"
        }
        TriggerClientEvent('licenses:showToClosest', source, data)
    end
end, false)

RegisterCommand("showlicense", function(source, args, rawCommand)
    if (source > 0) then
        local data = {
            FirstName = "William",
            LastName = "Dazzler",
            DOB = "1991/02/11",
            Issue = "03/10/22",
            CitizenID = "2001",
            Sex = "Male",
            Hair = "brown",
            Height = "180cm",
            Eyes = "blue",
            Image = "images/placeholder.png",
            Format = "driver_license"
        }
        TriggerClientEvent('licenses:showToClosest', source, data)
    end
end, false)
