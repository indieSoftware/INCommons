# ConfigLoader

A helper to load a configuration `plist` file and decoding it to a model.

For example the config file could contain all necessary data to run the app, e.g. server URLs, token IDs, etc.

### Example usage

Having a `Config.plist` file in the bundle which contains some properties, for example one with the key `id` providing a string value.

The following will simply load that config file and map it to the corresponding model.

```
struct ConfigModel: Decodable {
	let id: String
	// ...
}

guard case let .success(config) = ConfigLoader.parseConfig(named: "Config.plist") as Result<ConfigModel, ConfigLoader.Error> else {
	return
}
```

The model itself is not provided by the library, but can be fully defined by the project.

