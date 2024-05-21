import SwiftUI

struct MainTabView: View {
    @StateObject var viewModel = ProductViewModel()

    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Главная")
                }
                .environmentObject(viewModel)

            CartScreen()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Корзина")
                }
                .environmentObject(viewModel)

            ProfileScreen() // Добавьте ваш экран профиля или другой экран
                .tabItem {
                    Image(systemName: "person")
                    Text("Профиль")
                }
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    MainTabView()
}
