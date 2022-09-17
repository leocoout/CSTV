import NetworkingInterface

protocol HomeNetworkRequest: NetworkRequest {}

extension HomeNetworkRequest {
    var baseUrl: String {
        "https://api.pandascore.co/csgo"
    }
}
