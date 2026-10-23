import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

#if canImport(OrMacroMacros)
import OrMacroMacros

let testMacros: [String: Macro.Type] = [
    "om": OrMacro.self,
]
#endif

final
class OrMacroTests: XCTestCase {

    func testOrMacro() throws {
        #if canImport(OrMacroMacros)
            assertMacroExpansion("#om(Array())",
                                 expandedSource: "Array()",
                                 macros: testMacros
            )
        #else
            throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
//    
//    func testStringify() throws {
//        #if canImport(OrMacroMacros)
//            assertMacroExpansion(
//                """
//                #string()
//                """,
//                expandedSource: """
//                (a + b, "a + b")
//                """,
//                macros: testMacros
//            )
//        #else
//            throw XCTSkip("host platform")
//        #endif
//    }
    
}
