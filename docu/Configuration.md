# ConfigLoader

A helper to load a configuration `plist` file and decoding it to a model.

For example the config file could contain all necessary data to run the app, e.g. server URLs, token IDs, etc.

### Example usage

```
struct ConfigModel: Decodable {
	let id: String
	// ...
}

guard case let .success(config) = ConfigLoader.parseConfig(named: "Config.plist") as Result<ConfigModel, ConfigLoader.Error> else {
	return
}
```
