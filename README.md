# CSTV

### Description
The CSTV app uses the [pandascore.co](https://pandascore.co/) CS:GO API's to display available matches from running to not started status. Tapping on a match will route you to the details screen of the match, that contains data about the players for each team.

| Video | Match List | Details Screen |
| ------------- | ------------- | ----------- | 
| <img src="https://user-images.githubusercontent.com/42387881/191654108-2326829b-dbc4-4ba2-9d6a-016a7122b572.gif" width="300"> | <img src="https://user-images.githubusercontent.com/42387881/191653623-45bd8335-8263-4889-b71f-e1f23d3b55cd.png" width="300"> | <img src="https://user-images.githubusercontent.com/42387881/191653640-947a76fd-f2b9-44a7-b803-6e31ee5f5602.png" width="300"> |

### Instalation

This project was made using **Xcode 14.0**, Swift and UIKit and the following SPM Packages: 

- [Cartography](https://swiftpackageindex.com/robb/Cartography) - Package that uses proxy pattern to create clean programatic layouts with declarative style. 
- [Kingfisher](https://swiftpackageindex.com/onevcat/Kingfisher) - Used to download and cache images in a simpler way, without making the images flick or something else.
- [SimpleKeychain](https://swiftpackageindex.com/auth0/SimpleKeychain) - This keychain wrapper package was used to save the authorization token in a safe place (keychain). The main idea is to simulate obtaining the token from the server and retrieving it later using this package.
- Networking - This package was made by me and uses the new swift concurrency apis with Async/await

### Architecture

The diagram below I've made before starting developing the app and used as a "guide" while coding. Of course, it was changed during the development to match the project necessities. The diagram shows the entire app architecture. Basically, it was built using a Clean Architecture approach, dividing layers into:
- `Data` (in green), which is responsible for talking directly to the networking package for making requests and contains the repository to get the token for each network call;
- `Domain` (in yellow) is the main layer, which contains the business logic and domain models. This layer should be decoupled from everything else 
- `Presentation` is the layer that contains all UI logic and the MVVM pattern that we'll talk more soon.

![cstv_diagram](https://user-images.githubusercontent.com/42387881/191658010-f2633744-be17-4ed4-aa72-b6de01436ea1.png)


### Data Layer
The Data layer consists in decoupling all data and external things from the domain. It contains a repository that calls the `TokenRepository` to get tokens and the `Service` classes that creates the request objects and send to `Networking` Package. 

After the response, the decoded json is parsed into a `Response` model.

![CSTV drawio_da](https://user-images.githubusercontent.com/42387881/191662268-a2719f4d-19cc-4d72-a99a-ac7ec241a6ca.png)

### Domain layer

The domain layer should be decoupled as possible. It contains `UseCases` that centralizes the logic and makes it easier to change and test it.

### Presentation Layer 
The presentation layer centralizes all UI logic for the app and also the UI models that are used within cells. Every model that comes from the domain layer is adapted to a presentation model to avoid a high coupled code. **MVVM** is the choosen pattern which consists into Model-View-ViewModel. Its easier to understand, testable and maintanable. The diagram below shows an example of the `MatchList` implementation using the MVVM pattern with `Router` as a routing pattern instead of Coordinators. 

TableView logic was also moved from the ViewController class to its own `MatchListTableViewResponder` which only contains code about UITableViewDataSource and delegations.

Last but not least, the communication between the ViewModel and the View(controller) is made throught closures, that way we avoid making the ViewModel depending in an abstraction that should be implemented by some view. 

![cstv_drawio_mvvm](https://user-images.githubusercontent.com/42387881/191661433-09718878-191b-4a49-bc56-02b17f1ee6b0.png)

## Unit Testing

Unit tests were made using the default `XCTest` framework and contains usage of Depedency Injections and Dependency Inversion to use tecnhiques like **Fixtures** and **TestDoubles** to create mocks.

The code coverage (image below) shows the % of the code that was covered in unit tests.

<img width="1792" alt="Captura de Tela 2022-09-22 às 02 20 27" src="https://user-images.githubusercontent.com/42387881/191665061-f0c62f71-561f-4324-8a0c-424def3952ff.png">


## Considerations 

- For testing and mocking responses without changing codebase, I've used Charles Proxy
- Pandascore api unfortunately not returns the player's image_url most of the time, that's why the match details screen has blank images. If some team returns its players url, the app already handles it.
- I know that all these architecture structure for a project of this size are overkill but what I wanted to show you guys is the importance of decoupling classes (mainly in large scale projects), making classes isolated and easy to test, that is one of the things I value the most. Of course, for real projects, we should do our code as simple (but good) as possible (with quality) and evolve as necessary. 
- This project doest not use Combine, RXSwift and SwiftUI

