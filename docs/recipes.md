# Storage Recipes

## Storing and Retrieving Basic Preferences

This guide explains how to store simple configuration values such as a developer's theme preference. 

The Storage module provides a straightforward way to persist basic data strings across sessions. By relying on the module's interface, creators can set and retrieve configuration values without worrying about the underlying serialization mechanics.

```coffeescript
import Storage from "@dashkite/storage"

# save the theme preference
Storage.set "theme", "dark"

# retrieve the preference later
currentTheme = Storage.get "theme"
```

1. Identify the configuration key you wish to persist in the storage environment.
2. Use the `Storage.set` method with the key and its corresponding string value. 
3. Retrieve the value during a subsequent session using the `Storage.get` method with the identical key.

## Managing Complex Application State

This guide demonstrates how to persist nested JavaScript objects across page reloads.

Because `localStorage` only natively supports string values, saving rich data typically requires manual processing. The Storage module automatically translates complex arrays and nested objects using internal serialization logic, enabling creators to preserve entire application states natively.

```coffeescript
import Storage from "@dashkite/storage"

# fetch application state from an external provider
state = 
  favorites: [ 1, 2, 3 ]
  lastLogin: "2023-10-27T10:00:00Z"

# persist the nested object
Storage.set "app-state", state

# retrieve and instantiate the object
loadedState = Storage.get "app-state"
```

1. Define or fetch the complex data structure you wish to store.
2. Provide the key and the data structure directly to the `Storage.set` method. The module translates the object into a valid JSON string automatically.
3. Call the `Storage.get` method to retrieve the information. The module automatically parses the string back into a functional JavaScript object.

## Conditionally Purging Storage Keys

This guide explains how to verify the existence of a key before safely removing it from the storage environment.

Attempting to interact with non-existent data can occasionally lead to unexpected behaviors. By evaluating the storage state beforehand, developers ensure their removal logic executes predictably. Creators can also utilize implicit deletion by passing empty values directly to the setter method.

```coffeescript
import Storage from "@dashkite/storage"

# evaluate whether the targeted key exists
if Storage.has "temporary-data"
  # purge the data explicitly
  Storage.remove "temporary-data"

# alternatively, purge data implicitly
Storage.set "session-id", null
```

1. Evaluate whether the targeted key currently exists using the `Storage.has` method.
2. If the method returns true, call `Storage.remove` with the specific key to clear the data.
3. Alternatively, invoke the `Storage.set` method and pass `null` or `undefined` as the value to implicitly trigger the deletion process.
