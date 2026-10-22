import OrMacro

let result: String = #om(\String.count)

let resultInt: Int? = #om(\String.count)

print("The value \(result) was produced")
