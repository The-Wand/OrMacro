// swift-tools-version: 6.3
///
/// Copyright 2020 Aleksander Kozin
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Aleksander Kozin
/// The Wand

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "OrMacro",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v6),
        .macCatalyst(.v15)],
    products: [
        .library(
            name: "OrMacro",
            targets: ["OrMacro"]
        ),
        .executable(
            name: "OrMacroClient",
            targets: ["OrMacroClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git",
                 from: "603.0.0-latest"),
    ],
    targets: [
        .macro(
            name: "OrMacroMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(name: "OrMacro", dependencies: ["OrMacroMacros"]),
        .executableTarget(name: "OrMacroClient", dependencies: ["OrMacro"]),
        .testTarget(
            name: "OrMacroTests",
            dependencies: [
                "OrMacroMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport",
                         package: "swift-syntax"),
            ]
        ),
    ],
    swiftLanguageModes: [.v5]
)
