# Storage Reference

## get

$get: key \to value$

Retrieves the value associated with the specified key from the underlying Web Storage API. 

Because `localStorage` natively persists only strings, this method automatically invokes `JSON.parse` on the raw string data retrieved from the browser. This provides a transparent translation from the storage backend directly back into a rich JavaScript object. If the specified key does not exist within the storage environment, or if the environment fallback is currently active and the key is missing from the mock store, it returns `null`.

```coffeescript
import Storage from "@dashkite/storage"

# assuming previously stored JSON data
assert.deepEqual { theme: "dark" }, Storage.get "preferences"
```

## has

$has: key \to boolean$

Evaluates whether the specified key exists in the active storage environment and returns a corresponding boolean. 

This provides a safe, quick verification without invoking the underlying JSON parsing mechanics of `get`. Checking for existence before retrieving or removing data ensures the application handles storage state gracefully.

```coffeescript
import Storage from "@dashkite/storage"

assert.equal true, Storage.has "preferences"
```

## set

$set: key, value \to \emptyset$

Saves the provided value to the underlying Web Storage API under the specified key. 

To bypass the string-only limitation of `localStorage`, this method automatically serializes the provided data structure using `JSON.stringify` before committing it to storage. This translates complex application state into the format required by the browser's native API. If the provided value is `null` or `undefined`, the method interprets this as an implicit deletion and delegates to `remove`.

```coffeescript
import Storage from "@dashkite/storage"

# transparently stringifies the object for localStorage
Storage.set "preferences", { theme: "dark" }
```

## remove

$remove: key \to \emptyset$

Purges the specified key and its associated string value from the active storage environment. 

This directly clears the data from `localStorage` or the environment fallback, ensuring that subsequent requests reflect the deletion immediately. 

```coffeescript
import Storage from "@dashkite/storage"

Storage.remove "preferences"
assert.equal false, Storage.has "preferences"
```
