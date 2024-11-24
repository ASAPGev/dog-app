import ProjectDescription

let target = Target(
    name: "Dog",
    platform: .iOS,
    product: .app,
    bundleId: "com.asapGev.dog",
    deploymentTarget: .iOS(targetVersion: "17.4", devices: .iphone),
    infoPlist: "Info.plist",
    sources: [.glob( "Dog/**", excluding: "ChatKit/Resources/**")],
    resources: "Dog/Resources/**",
    dependencies: [
//        .package(product: "SwiftLint")
    ]
)

let project = Project(
    name: "Dog",
    packages: [
//            .remote(
//                url: "https://github.com/realm/SwiftLint.git",
//                requirement: .upToNextMajor(from: "0.57.0")
//            )
        ],
    targets: [target]
)
