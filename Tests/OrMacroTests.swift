import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

#if canImport(OrMacroMacros)
import OrMacroMacros

let testMacros: [String: Macro.Type] = [
    "om": OrStringMacro.self,
]
#endif

final
class OrMacroTests: XCTestCase {

//    @inlinable
//    func testOrIntMacro() throws {
//        #if canImport(OrMacroMacros)
//            assertMacroExpansion(
//                """
//                #om(Array())
//                """,
//                expandedSource:
//                """
//                "Array()"
//                """,
//                macros: testMacros
//            )
//        #else
//            throw XCTSkip("macros are only supported when running tests for the host platform")
//        #endif
//    }
    
    @inlinable
    func testOrStringifyMacro() throws {
        #if canImport(OrMacroMacros)
            assertMacroExpansion(
                    """
                    #om(Array())
                    """,
                    expandedSource:
                    """
                    "Array()"
                    """,
                    macros: testMacros
            )
        #else
            throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
    
}
