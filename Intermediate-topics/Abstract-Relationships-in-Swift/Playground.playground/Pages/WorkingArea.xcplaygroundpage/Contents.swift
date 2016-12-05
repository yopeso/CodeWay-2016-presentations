// Protocols
protocol Boy {
  associatedtype RingType
  
  func impress()
  func propose(with ring: RingType)
}

protocol Smart {
  func tellSmartThings()
}

protocol Pretty {
  func smile()
}

// Procotol extensions
extension Smart {
  func tellSmartThings() {
    print("What if I tell you 1+1=3?")
  }
}

extension Pretty {
  func smile() {
    print("☺️")
  }
}

extension Boy {
  func propose(with ring: RingType) {
    print("Will you marry me?")
  }
  
}

// Structs
struct Ring {}

struct SmartBoy: Boy, Smart {
  typealias RingType = Ring
  func impress() {
    tellSmartThings()
  }
}

struct PrettyBoy: Boy, Pretty {
  typealias RingType = Ring
  
  func impress() {
    smile()
  }
}

struct PerfectBoy: Boy, Smart, Pretty {
  typealias RingType = Ring
  
  func impress() {
    smile()
    tellSmartThings()
  }
}

protocol Girl {
  associatedtype Partner
  
  func date(_ partner: Partner)
}

struct SmartGirl: Girl {
  func date(_ partner: AnySmartBoy<Ring>) {
    // kisses, tea, and so on... :P
  }
}

struct PrettyGirl<B: Boy & Pretty>: Girl {
  func date(_ partner: B) {
    // kisses, tea, and so on... :P
  }
}

// Type erasure
/*
 Create a concerete type conformin to Boy & Smart
 Inject the abstract type
 Store the functions
 Redirect calls to stored functions
 */
struct AnySmartBoy<R>: Boy, Smart {
  typealias RingType = R
  
  private let _impress: (Void) -> Void
  private let _propose: (R) -> Void
  
  init<B: Boy & Smart>(_ erased: B) where B.RingType == R {
    _impress = erased.impress
    _propose = erased.propose
  }
  
  
  func impress() {
    _impress()
  }
  
  func propose(with ring: R) {
    _propose(ring)
  }
}


// Boys
let john = SmartBoy()
let tom = PrettyBoy()
let matt = PerfectBoy()

// Girls
let emma = SmartGirl()
let kate = PrettyGirl<PrettyBoy>()

// Relationships
emma.date(AnySmartBoy(john))
emma.date(AnySmartBoy(matt))
kate.date(tom)
//kate.date(matt)

















