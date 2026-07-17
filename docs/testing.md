# Testing

The `@dashkite/storage` package is tested using the `@dashkite/amen` testing framework alongside `@dashkite/assert` for assertions.

The test suite validates the expected behavior of the Storage wrapper, ensuring proper serialization, retrieval, and existence checks. Additionally, it confirms that the environment fallback mechanisms function correctly when `localStorage` is either present or absent.

To execute the test suite, run the following command from the root of the repository:

```bash
npx genie test
```

If the `genie` command is unavailable, you may also utilize `pnpm run test` as a fallback.
