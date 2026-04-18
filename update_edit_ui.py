import re

with open("lib/features/feed/presentation/edit_feed_screen.dart", "r") as f:
    original = f.read()

# Replace the row with two dropdowns with the beautiful looking for selector and property type selector
old_code = """                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _listingTypes.contains(_listingType) ? _listingType : 'Sell',
                              decoration: const InputDecoration(labelText: 'Listing Type', border: OutlineInputBorder()),
                              items: _listingTypes.map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
                              onChanged: (val) => setState(() => _listingType = val!),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _propertyTypes.contains(_propertyType) ? _propertyType : 'Residential',
                              decoration: const InputDecoration(labelText: 'Property Type', border: OutlineInputBorder()),
                              items: _propertyTypes.map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
                              onChanged: (val) => setState(() => _propertyType = val!),
                            ),
                          ),
                        ],
                      ),"""

# We can find this old logic, or wait, I already changed 'Residential' to 'Villas'. Let's match it via python.
