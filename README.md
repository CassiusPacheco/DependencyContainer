# DependencyContainer

This micro-framework provides a dependency container that's as simple as registering and resolving dependencies.

The project is inspired on [Martin Fowler](https://twitter.com/martinfowler)'s article about [Inversion of Control Containers and the Dependency Injection pattern](https://martinfowler.com/articles/injection.html).

I've also written a blog post about [Applying Dependency Injection to Composable Routing for iOS Apps](https://cassiuspacheco.com/applying-dependency-injection-to-composable-routing-for-ios-apps-ck7v10xaz01h9zis1oksoe7h0). Have a read at it too to see a sample app making use of the framework.

For a quick code sample look at the gist below:

```
import DependencyContainer

protocol APIClientInterface {
  func get() -> Data
}

class APIClient: APIClientInterface {
  func get() -> Data {
    ...
  }
}

protocol ViewModelInterface {
  func doSomething()
}

class ViewModel: ViewModelInterface {
  private let api: APIClientInterface

  init(api: APIClientInterface) {
    self.api = api
  }

  func doSomething() {
    ...
  }
}

// Create a container and register dependencies
let container = DependencyContainer()

container.register(APIClientInterface.self) { innerContainer in
  return APIClient()
}

// ViewModel depends on APIClient, so in its registration it's setup to
// resolve any inner dependency recursively
container.register(ViewModelInterface.self) { innerContainer in
  return ViewModel(api: innerContainer.resolve(APIClientInterface.self))
}

let viewModel = container.resolve(ViewModelInterface.self)
viewModel.doSomething()
```
