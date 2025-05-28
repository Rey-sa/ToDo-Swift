import Testing
@testable import ToDoListDemo

struct ToDoListDemoTests {

    @Test func testNonEmptyAssertions() throws {
           // let title: String? = "Sport"
           // let emptyString: String? = ""
            let nilString: String? = nil

            // Expected no crashs
            //assertNonEmpty(title, message: "Title should not be empty!")

            //Expected Assertion Failures
        
             //assertNonEmpty(emptyString, message: "Empty string detected")
            assertNonEmpty(nilString, message: "Nil string detected")
        }
    }
