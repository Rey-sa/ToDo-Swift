import Foundation

//Asserted Variable States
func assertNonEmpty(_ text: String?, message: String){
    assert((text?.isEmpty == false), message)
}



