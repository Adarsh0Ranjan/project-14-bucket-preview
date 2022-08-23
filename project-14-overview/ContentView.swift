//
//  ContentView.swift
//  project-14-overview
//
//  Created by Roro Solutions on 19/08/22.
//
//lecture-5
import LocalAuthentication
import SwiftUI
struct ContentView:  View{
    @State private var isUnlocked = false
    var body: some View{
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)

        
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

//lecture-4-Integrating MapKit with SwiftUI
//import SwiftUI
//import MapKit
//struct Location: Identifiable {
//    let id = UUID()
//    let name: String
//    let coordinate: CLLocationCoordinate2D
//}
//struct ContentView : View{
//    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
//
//    let locations = [
//        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
//        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
//    ]
//    var body: some View{
////        Map(coordinateRegion: $mapRegion)
//        NavigationView {
//            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
//                MapAnnotation(coordinate: location.coordinate) {
//                    NavigationLink {
//                        Text(location.name)
//                    } label: {
//                        Circle()
//                            .stroke(.red, lineWidth: 3)
//                            .frame(width: 44, height: 44)
//                    }
//                }
//            }
//            .navigationTitle("London Explorer")
//        }
//    }
//}

//lecture-3-switching view with enum
//enum LoadingState {
//    case loading, success, failed
//}
//struct LoadingView: View {
//    var body: some View {
//        Text("Loading...")
//    }
//}
//
//struct SuccessView: View {
//    var body: some View {
//        Text("Success!")
//    }
//}
//
//struct FailedView: View {
//    var body: some View {
//        Text("Failed.")
//    }
//}
//struct ContentView: View {
//    var loadingState = LoadingState.loading
//    var body: some View{
//        if loadingState == .loading {
//            LoadingView()
//        } else if loadingState == .success {
//            SuccessView()
//        } else if loadingState == .failed {
//            FailedView()
//        }
//    }
//}

//lecture-2-Writing data to the documents directory
//struct ContentView: View {
//    var body: some View{
//        Text("Hello World")
//            .onTapGesture {
//                let str = "Test Message"
//                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
//
//                do {
//                    try str.write(to: url, atomically: true, encoding: .utf8)
//                    let input = try String(contentsOf: url)
//                    print(input)
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//    }
//    func getDocumentsDirectory() -> URL {
//        // find all possible documents directories for this user
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//
//        // just send back the first one, which ought to be the only one
//        return paths[0]
//    }
//}

////lecture-1-Adding conformance to Comparable for custom types
//import SwiftUI
//struct User: Identifiable, Comparable {
//    let id = UUID()
//    let firstName: String
//    let lastName: String
//
//    static func <(lhs: User, rhs: User) -> Bool {
//            lhs.lastName < rhs.lastName
//        } // the method must be marked as static, which means it’s called on the User struct directly rather than a single instance of the struct.
//}
//struct ContentView: View {
//    let users = [
//        User(firstName: "Arnold", lastName: "Rimmer"),
//        User(firstName: "Kristine", lastName: "Kochanski"),
//        User(firstName: "David", lastName: "Lister"),
//    ].sorted()
//
//    var body: some View {
//        List(users) { user in
//            Text("\(user.lastName), \(user.firstName)")
//        }
//    }
//}
//
////struct User: Identifiable {
////    let id = UUID()
////    let firstName: String
////    let lastName: String
////
////   }
////struct ContentView: View {
////    let users = [
////        User(firstName: "Arnold", lastName: "Rimmer"),
////        User(firstName: "Kristine", lastName: "Kochanski"),
////        User(firstName: "David", lastName: "Lister"),
////    ].sorted {
////        $0.lastName < $1.lastName  // That absolutely works, but it’s not an ideal solution  bcz we need to use this agin and agin whever we need to sort so, swift ui cam eup new soloution a. after add
////    }
////    var body: some View {
////        List(users) { user in
////            Text("\(user.lastName), \(user.firstName)")
////        }
////    }
////}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
