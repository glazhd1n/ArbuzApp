import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        @State var productRepository = ProductRepository()
        @State var productViewModel = ProductViewModel(productService: ProductService(productRepository: productRepository))
        @State var cartViewModel = CartViewModel(cartService: CartService(cartRepository: CartRepository()))
        let mainView = UIHostingController(rootView: HomeScreen()
            .environmentObject(productViewModel)
            .environmentObject(cartViewModel)
        )
        mainView.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), tag: 0)
        
        let cartView = UIHostingController(rootView: CartScreen()
            .environmentObject(cartViewModel)
        )
        cartView.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "cart"), tag: 1)
        
        let favoritesView = UIHostingController(rootView: FavoriteScreen()
            .environmentObject(productRepository)
            .environmentObject(cartViewModel)
        )
        favoritesView.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "heart"), tag: 2)
        
        viewControllers = [mainView, cartView, favoritesView]
    }
}

struct MainTabBarControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainTabBarController {
        return MainTabBarController()
    }
    
    func updateUIViewController(_ uiViewController: MainTabBarController, context: Context) {}
}
