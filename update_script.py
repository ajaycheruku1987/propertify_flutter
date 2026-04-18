import re

with open("lib/features/feed/presentation/edit_feed_screen.dart", "r") as f:
    code = f.read()

# Replace assignments in initState
code = re.sub(r"_bedroomsController = TextEditingController\(text: widget\.property\.bedrooms\?\.toString\(\) \?\? '0'\);", "_bedroomsController = TextEditingController(text: '0');", code)
code = re.sub(r"_bathroomsController = TextEditingController\(text: widget\.property\.bathrooms\?\.toString\(\) \?\? '0'\);", "_bathroomsController = TextEditingController(text: '0');", code)
code = re.sub(r"_areaController = TextEditingController\(text: widget\.property\.areaSqft\?\.toString\(\) \?\? '0'\);", "_areaController = TextEditingController(text: '0');", code)
code = re.sub(r"_floorController = TextEditingController\(text: widget\.property\.floor\?\.toString\(\) \?\? '0'\);", "_floorController = TextEditingController(text: '0');", code)
code = re.sub(r"_totalFloorsController = TextEditingController\(text: widget\.property\.totalFloors\?\.toString\(\) \?\? '0'\);", "_totalFloorsController = TextEditingController(text: '0');", code)
code = re.sub(r"_propertyAgeController = TextEditingController\(text: widget\.property\.propertyAgeYears\?\.toString\(\) \?\? '0'\);", "_propertyAgeController = TextEditingController(text: '0');", code)
code = re.sub(r"_amenitiesController = TextEditingController\(text: widget\.property\.amenities\?\.join\(\',\'\) \?\? \'\'\);", "_amenitiesController = TextEditingController(text: '');", code)
code = re.sub(r"_furnishing = widget\.property\.furnishing \?\? 'Unfurnished';", "_furnishing = 'Unfurnished';", code)
code = re.sub(r"_latitude = double\.tryParse\(widget\.property\.latitude \?\? \'\'\);", "_latitude = widget.property.latitude?.toDouble();", code)
code = re.sub(r"_longitude = double\.tryParse\(widget\.property\.longitude \?\? \'\'\);", "_longitude = widget.property.longitude?.toDouble();", code)


code = re.sub(r"availableFrom: widget\.property\.availableFrom \?\? DateTime\.now\(\)\.toIso8601String\(\)", "availableFrom: DateTime.now().toIso8601String()", code)
code = re.sub(r"isVerified: widget\.property\.isVerified \?\? false", "isVerified: false", code)

with open("lib/features/feed/presentation/edit_feed_screen.dart", "w") as f:
    f.write(code)

