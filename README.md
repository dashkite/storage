# Storage

*Simple `LocalStorage` wrapper for JSON data*

[![Hippocratic License HL3-CORE](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-CORE&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/core.html)

The `@dashkite/storage` package provides a straightforward and reliable way to manage JSON data in the browser using the native `localStorage` API. It automatically handles serialization and parsing, while providing a graceful fallback mechanism for environments where `localStorage` is unavailable.

## Features

- Provides a clean wrapper around `localStorage`.
- Automatically serializes to and parses from JSON.
- Falls back to an in-memory object safely when `localStorage` is not accessible (e.g., Server-Side Rendering environments).
- Exposes a minimal and intuitive interface.

## Installation

```bash
pnpm install @dashkite/storage
```

## Usage

You can use the Storage object directly to manage key-value pairs without worrying about manual JSON serialization.

```coffeescript
import Storage from "@dashkite/storage"

# store a complex object
Storage.set "developer-preferences", 
  theme: "dark"
  notifications: true

# retrieve the object later
preferences = Storage.get "developer-preferences"

# check if a key exists
if Storage.has "developer-preferences"
  # perform some cleanup
  Storage.remove "developer-preferences"
```

## Other Resources

- [Reference Documentation](docs/reference.md)
- [Usage Guides](docs/recipes.md)
- [Technical Notes](docs/technical-notes.md)
- [Testing](docs/testing.md)
