import Dispatch
import PromiseKit
import XCTest

// Exercise the whole API through DispatchQueue wrappers. The test here is really
// that everything compiles smoothly, not anything that happens at test time.

class DispatchWrapperTests: XCTestCase {
    
    enum TestError: Error, Equatable {
        case errorOne
        case errorTwo
        case errorThree
        case errorFour
        case errorFive
        case errorSix
        case errorSeven
        case errorEight
    }
    
    enum DistractorError: Error, Equatable {
        case one
    }

    func testWrappedPromiseThenableAPI() {
        let ex = expectation(description: "DispatchQueue Promise API")
        Promise.value(42).then(on: .global()) {
            Promise.value($0 + 10)
        }.map(on: .global()) {
            $0 + 10
        }.get(on: .global()) {
            XCTAssert($0 == 62)
        }.tap(on: .global()) { result in
            if case let .success(x) = result {
                XCTAssert(x == 62)
            } else {
                XCTFail()
            }
        }.compactMap(on: .global()) {
            $0 + 10
        }.done(on: .global()) {
            XCTAssert($0 == 72)
            ex.fulfill()
        }.catch { _ in
            XCTFail()
        }
        
    }
    
    func testWrappedPromiseErrorAPI() {
        let ex = expectation(description: "DispatchQueue Promise Error API")
        var value = 0
        let x = Promise.value(42).then { _ -> Promise<Int> in
            throw TestError.errorOne
            return Promise.value(42)
        }
        x.recover(TestError.errorOne, on: conf.D.map) { () -> Promise<Int> in
            XCTAssert(error == TestError.errorOne)
            value += 1
            throw TestError.errorTwo
            return Promise.value(52)
        }
//        x.recover(PMKError, on: .global()) { error -> Promise<Int> in
//            XCTAssert(error == PMKError.badInput)
//            value += 10
//            throw PMKError.returnedSelf
//            return Promise.value(52)
//        }.recover(on: .global()) { error -> Promise<Int> in
//            XCTAssert(error == PMKError.returnedSelf)
//            value += 100
//            throw PMKError.invalidCallingConvention
//            return Promise.value(52)
//        }.recover(PMKError.emptySequence, on: .global()) {
//            XCTFail()
//        }.recover(PMKError.invalidCallingConvention, on: .global()) { error -> Void in
//            XCTAssert(error == PMKError.invalidCallingConvention)
//            value += 1_000
//            throw PMKError.badInput
//        }.recover(TestError, on: .global()) { error -> Void in
//            XCTFail()
//        }.recover(PMKError.badInput, on: .global()) { error -> Void in
//            XCTAssert(error == PMKError.badInput)
//            value += 10_000
//            throw PMKError.returnedSelf
//        }.ensure(on: .global()) {
//            value += 100_000
//        }.catch { error in
//            XCTAssert(error == PMKError.returnedSelf)
//            value += 1_000_000
//            ex.fulfill()
//        }
//        waitForExpectations(timeout: 1)
//        XCTAssert(value == 1_111_111)
    }
}

//done
//get
//tap
//then (x2 for cancellable)
//map
//compactMap
//
//
//func testMapValues() {
//    let ex1 = expectation(description: "DispatchQueue MapValues compatibility")
//    Promise.value([42, 52]).mapValues(on: .global(qos: .background), flags: .barrier) {
//        $0 + 10
//        }.compactMap(on: .global(qos: .background), flags: .barrier) {
//            $0
//        }.flatMapValues(on: .global(qos: .background), flags: .barrier) {
//            [$0 + 10]
//        }.compactMapValues(on: .global(qos: .background), flags: .barrier) {
//            $0 + 10
//        }.thenMap(on: .global(qos: .background), flags: .barrier) {
//            Promise.value($0 + 10)
//        }.thenFlatMap(on: .global(qos: .background), flags: .barrier) {
//            Promise.value([$0 + 10])
//        }.filterValues(on: .global(qos: .background), flags: .barrier) { _ in
//            true
//        }.sortedValues(on: .global(qos: .background), flags: .barrier).firstValue(on: .global(qos: .background), flags: .barrier) { _ in
//            true
//        }.done(on: .global(qos: .background), flags: .barrier) {
//            XCTAssertEqual($0, 92)
//            ex1.fulfill()
//        }.catch(on: .global(qos: .background), flags: .barrier) { _ in
//            XCTFail()
//    }
//
//    let ex2 = expectation(description: "DispatchQueue firstValue property")
//    Promise.value([42, 52]).firstValue.done(on: .global(qos: .background), flags: .barrier) {
//        XCTAssertEqual($0, 42)
//        ex2.fulfill()
//        }.catch(on: .global(qos: .background), flags: .barrier, policy: .allErrors) { _ in
//            XCTFail()
//    }
//
//    let ex3 = expectation(description: "DispatchQueue lastValue property")
//    Promise.value([42, 52]).lastValue.done(on: .global(qos: .background), flags: .barrier) {
//        XCTAssertEqual($0, 52)
//        ex3.fulfill()
//        }.catch(on: .global(qos: .background), flags: .barrier, policy: .allErrors) { _ in
//            XCTFail()
//    }
//
//    waitForExpectations(timeout: 1)
//}
//
//
//thenable
//
//done
//get
//tap
//then (x2 for cancellable)
//map
//compactMap
//
//catchable
//
//catch x 3
//
//recover
//
//recover x3
//recover x3 for void
//recover x3 more for cancellable
//recover producing guarantee (promise only)
//recover producing void guarantee (promise only)
//
//ensure
//    returning Void
//    returning void promise
//
//finally
