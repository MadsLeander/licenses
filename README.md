# Licenses
Licenses is a small dev resource. The background images are based on the state of California driver licenses. The html/css is not responsive, but feel free to contribute if you decide to do it yourself.

# Usage
## Exports
**ShowToClosest**  
Finds the closest player and shows them the license  
```exports.licenses:ShowToClosest(data)```

**ShowToSelf**  
Shows the player their own license  
```exports.licenses:ShowToSelf(data)```

## Events
Client:
```TriggerEvent('licenses:displayOnClient', data)```

Server:
```TriggerEvent('licenses:display', receiver, data)```  
-This just triggers licenses:displayOnClient on the target client

## Data
When executing a function you need the following data (this is an example showing required data):
```
local data = {
    FirstName = "first name",
    LastName = "last name",
    DOB = "dateofbirth", -- 1997/10/02
    Issue = os.date("%x"), -- can be changed just an example
    CitizenID = "1001", -- A unique identifier
    Sex = "Male", -- Male/Female or whatever you like.
    Hair = "brown",
    Height = "180cm", -- can be whatever unit of measurement
    Eyes = "blue" -- eye colour
    Image = "images/placeholder.png", -- or alternativly images from online (like this one: https://i.imgur.com/R1TsPF8.png)
    Format = "id" --id/driver_license
}
```

# Examples
```
exports.licenses:ShowToSelf({
    FirstName = "Robert",
    LastName = "Williams",
    DOB = "1997/10/02",
    Issue = 02/27/22",
    CitizenID = "26",
    Sex = "Male",
    Hair = "brown",
    Height = "180cm",
    Eyes = "blue"
    Image = "https://i.imgur.com/R1TsPF8.png",
    Format = "driver_license"
})
```

Something like this could be used if you have the license/id as an item in an inventory:  
```exports.licenses:ShowToClosest(data.customData)```

## Image
Driver License
https://i.imgur.com/YdplMiw.png

Id Card
https://i.imgur.com/lScfK3V.png
