#if !canImport(ObjectiveC)
import XCTest

extension AfterTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__AfterTests = [
        ("testNegative", testNegative),
        ("testPositive", testPositive),
        ("testZero", testZero),
    ]
}

extension CancellationTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__CancellationTests = [
        ("testCancellation", testCancellation),
        ("testFoundationBridging1", testFoundationBridging1),
        ("testFoundationBridging2", testFoundationBridging2),
        ("testIsCancelled", testIsCancelled),
        ("testRecoverWithCancellation", testRecoverWithCancellation),
        ("testThrowCancellableErrorThatIsNotCancelled", testThrowCancellableErrorThatIsNotCancelled),
    ]
}

extension CatchableTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__CatchableTests = [
        ("test__conditional_recover", test__conditional_recover),
        ("test__conditional_recover__fulfilled_path", test__conditional_recover__fulfilled_path),
        ("test__conditional_recover__ignores_cancellation_but_fed_cancellation", test__conditional_recover__ignores_cancellation_but_fed_cancellation),
        ("test__conditional_recover__no_recover", test__conditional_recover__no_recover),
        ("test__full_recover", test__full_recover),
        ("test__full_recover__fulfilled_path", test__full_recover__fulfilled_path),
        ("test__void_specialized_conditional_recover", test__void_specialized_conditional_recover),
        ("test__void_specialized_conditional_recover__fulfilled_path", test__void_specialized_conditional_recover__fulfilled_path),
        ("test__void_specialized_conditional_recover__ignores_cancellation_but_fed_cancellation", test__void_specialized_conditional_recover__ignores_cancellation_but_fed_cancellation),
        ("test__void_specialized_conditional_recover__no_recover", test__void_specialized_conditional_recover__no_recover),
        ("test__void_specialized_full_recover", test__void_specialized_full_recover),
        ("test__void_specialized_full_recover__fulfilled_path", test__void_specialized_full_recover__fulfilled_path),
        ("testCatchOnly", testCatchOnly),
        ("testCatchOnly_BaseCatchIsCalledWhenCatchOnlyDoesNotExecute", testCatchOnly_BaseCatchIsCalledWhenCatchOnlyDoesNotExecute),
        ("testCatchOnly_BaseCatchIsNotCalledAfterCatchOnlyExecutes", testCatchOnly_BaseCatchIsNotCalledAfterCatchOnlyExecutes),
        ("testCatchOnly_Mixed", testCatchOnly_Mixed),
        ("testCatchOnly_PatternMatch_1", testCatchOnly_PatternMatch_1),
        ("testCatchOnly_PatternMatch_2", testCatchOnly_PatternMatch_2),
        ("testCatchOnly_Type", testCatchOnly_Type),
        ("testCatchOnly_Type_BaseCatchIsNotCalledAfterCatchOnlyExecutes", testCatchOnly_Type_BaseCatchIsNotCalledAfterCatchOnlyExecutes),
        ("testCatchOnly_Type_Cancellation_Handle", testCatchOnly_Type_Cancellation_Handle),
        ("testCatchOnly_Type_Cancellation_Ignore", testCatchOnly_Type_Cancellation_Ignore),
        ("testCatchOnly_Type_Ignored", testCatchOnly_Type_Ignored),
        ("testCatchOnly_Type_PatternMatch_1", testCatchOnly_Type_PatternMatch_1),
        ("testCatchOnly_Type_PatternMatch_2", testCatchOnly_Type_PatternMatch_2),
        ("testCauterize", testCauterize),
        ("testEnsureThen_Error", testEnsureThen_Error),
        ("testEnsureThen_Value", testEnsureThen_Value),
        ("testFinally", testFinally),
        ("testRecoverOnly_BaseRecoverIsNotCalledAfterRecoverOnlyExecutes", testRecoverOnly_BaseRecoverIsNotCalledAfterRecoverOnlyExecutes),
        ("testRecoverOnly_Chaining", testRecoverOnly_Chaining),
        ("testRecoverOnly_Object", testRecoverOnly_Object),
        ("testRecoverOnly_Object_DoesNotReturnSelf", testRecoverOnly_Object_DoesNotReturnSelf),
        ("testRecoverOnly_Object_Ignored", testRecoverOnly_Object_Ignored),
        ("testRecoverOnly_Object_PatternMatch", testRecoverOnly_Object_PatternMatch),
        ("testRecoverOnly_Object_Void", testRecoverOnly_Object_Void),
        ("testRecoverOnly_Object_Void_Fufilled", testRecoverOnly_Object_Void_Fufilled),
        ("testRecoverOnly_Object_Void_Ignored", testRecoverOnly_Object_Void_Ignored),
        ("testRecoverOnly_Type", testRecoverOnly_Type),
        ("testRecoverOnly_Type_Cancellation_Handle", testRecoverOnly_Type_Cancellation_Handle),
        ("testRecoverOnly_Type_Cancellation_Ignore", testRecoverOnly_Type_Cancellation_Ignore),
        ("testRecoverOnly_Type_DoesNotReturnSelf", testRecoverOnly_Type_DoesNotReturnSelf),
        ("testRecoverOnly_Type_Ignored", testRecoverOnly_Type_Ignored),
        ("testRecoverOnly_Type_PatternMatch", testRecoverOnly_Type_PatternMatch),
        ("testRecoverOnly_Type_Void", testRecoverOnly_Type_Void),
        ("testRecoverOnly_Type_Void_Cancellation_Ignore", testRecoverOnly_Type_Void_Cancellation_Ignore),
        ("testRecoverOnly_Type_Void_Fufilled", testRecoverOnly_Type_Void_Fufilled),
        ("testRecoverOnly_Type_Void_Ignored", testRecoverOnly_Type_Void_Ignored),
        ("testRecoverOnly_Type_Void_Rethrow", testRecoverOnly_Type_Void_Rethrow),
    ]
}

extension ChainDispatcherTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ChainDispatcherTests = [
        ("testAdHocStickyDispatchers", testAdHocStickyDispatchers),
        ("testDelayedConfirmationChainDispatcher", testDelayedConfirmationChainDispatcher),
        ("testIndefinitelyDelayedConfirmationChainDispatcher", testIndefinitelyDelayedConfirmationChainDispatcher),
        ("testPermanentTail", testPermanentTail),
        ("testRConfirmedChainDispatcher", testRConfirmedChainDispatcher),
        ("testResetChainDispatcher", testResetChainDispatcher),
        ("testSimpleChain", testSimpleChain),
        ("testSimpleChainDispatcher", testSimpleChainDispatcher),
        ("testStickyChainDispatcher", testStickyChainDispatcher),
        ("testThresholdChainDispatcher", testThresholdChainDispatcher),
        ("testUnconfirmedStickyChainDispatcher", testUnconfirmedStickyChainDispatcher),
    ]
}

extension DispatchWrapperTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__DispatchWrapperTests = [
        ("testWrappedGuaranteeAPI", testWrappedGuaranteeAPI),
        ("testWrappedPromiseCatchAPI", testWrappedPromiseCatchAPI),
        ("testWrappedPromiseEnsureAPI", testWrappedPromiseEnsureAPI),
        ("testWrappedPromiseRecoverAPI", testWrappedPromiseRecoverAPI),
        ("testWrappedPromiseSequenceAPI", testWrappedPromiseSequenceAPI),
        ("testWrappedPromiseThenableAPI", testWrappedPromiseThenableAPI),
    ]
}

extension DispatcherTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__DispatcherTests = [
        ("testConfQRepresentation", testConfQRepresentation),
        ("testDispatcherExtensionCanThrowInBody", testDispatcherExtensionCanThrowInBody),
        ("testDispatcherExtensionReturnsGuarantee", testDispatcherExtensionReturnsGuarantee),
        ("testDispatcherWithThrow", testDispatcherWithThrow),
        ("testDispatchQueueSelection", testDispatchQueueSelection),
        ("testMapValues", testMapValues),
        ("testPMKDefaultIdentity", testPMKDefaultIdentity),
        ("testRecover", testRecover),
    ]
}

extension DispatcherTypeTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__DispatcherTypeTests = [
        ("testConcurrencyLimitedDispatcher", testConcurrencyLimitedDispatcher),
        ("testConcurrencyLimitedDispatcherInit", testConcurrencyLimitedDispatcherInit),
        ("testRateLimitedDispatcher", testRateLimitedDispatcher),
        ("testRateLimitedDispatcherInit", testRateLimitedDispatcherInit),
        ("testStrictRateLimitedDispatcher", testStrictRateLimitedDispatcher),
        ("testStrictRateLimitedDispatcherInit", testStrictRateLimitedDispatcherInit),
    ]
}

extension GuaranteeTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__GuaranteeTests = [
        ("testInit", testInit),
        ("testThenMap", testThenMap),
        ("testWait", testWait),
    ]
}

extension HangTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__HangTests = [
        ("test", test),
        ("testError", testError),
    ]
}

extension JoinTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__JoinTests = [
        ("testFulfilledAfterAllResolve", testFulfilledAfterAllResolve),
        ("testImmediates", testImmediates),
    ]
}

extension LoggingTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__LoggingTests = [
        ("testCauterizeIsLogged", testCauterizeIsLogged),
        ("testExtraneousFlagsSpecified", testExtraneousFlagsSpecified),
        ("testGuaranteeWaitOnMainThreadLogged", testGuaranteeWaitOnMainThreadLogged),
        ("testLogging", testLogging),
        ("testNilDispatchQueueWithFlags", testNilDispatchQueueWithFlags),
        ("testPendingGuaranteeDeallocatedIsLogged", testPendingGuaranteeDeallocatedIsLogged),
        ("testPendingPromiseDeallocatedIsLogged", testPendingPromiseDeallocatedIsLogged),
        ("testPromiseWaitOnMainThreadLogged", testPromiseWaitOnMainThreadLogged),
    ]
}

extension PMKDefaultDispatchQueueTest {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__PMKDefaultDispatchQueueTest = [
        ("testOverrodeDefaultAlwaysQueue", testOverrodeDefaultAlwaysQueue),
        ("testOverrodeDefaultCatchQueue", testOverrodeDefaultCatchQueue),
        ("testOverrodeDefaultThenQueue", testOverrodeDefaultThenQueue),
    ]
}

extension PMKErrorTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__PMKErrorTests = [
        ("testCustomDebugStringConvertible", testCustomDebugStringConvertible),
        ("testCustomStringConvertible", testCustomStringConvertible),
    ]
}

extension PromiseTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__PromiseTests = [
        ("testCanMakeVoidPromise", testCanMakeVoidPromise),
        ("testCannotFulfillWithError", testCannotFulfillWithError),
        ("testCustomStringConvertible", testCustomStringConvertible),
        ("testDispatcherDispatchExtensionCanThrowInBody", testDispatcherDispatchExtensionCanThrowInBody),
        ("testDispatcherDispatchExtensionDoesNotInterfereWithRegularDispatch", testDispatcherDispatchExtensionDoesNotInterfereWithRegularDispatch),
        ("testDispatcherDispatchExtensionReturnsGuarantee", testDispatcherDispatchExtensionReturnsGuarantee),
        ("testDispatchQueueAsyncExtensionCanThrowInBody", testDispatchQueueAsyncExtensionCanThrowInBody),
        ("testDispatchQueueAsyncExtensionReturnsGuarantee", testDispatchQueueAsyncExtensionReturnsGuarantee),
        ("testIsFulfilled", testIsFulfilled),
        ("testIsPending", testIsPending),
        ("testIsRejected", testIsRejected),
        ("testIsResolved", testIsResolved),
        ("testPipeForResolved", testPipeForResolved),
        ("testThrowInFirstly", testThrowInFirstly),
        ("testThrowInInitializer", testThrowInInitializer),
        ("testWait", testWait),
    ]
}

extension RaceTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__RaceTests = [
        ("test1", test1),
        ("test1Array", test1Array),
        ("test2", test2),
        ("test2Array", test2Array),
        ("testEmptyArray", testEmptyArray),
        ("testReject", testReject),
    ]
}

extension RegressionTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__RegressionTests = [
        ("testReturningPreviousPromiseWorks", testReturningPreviousPromiseWorks),
    ]
}

extension StressTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__StressTests = [
        ("testThenDataRace", testThenDataRace),
        ("testThensAreSequentialForLongTime", testThensAreSequentialForLongTime),
        ("testZalgoDataRace", testZalgoDataRace),
    ]
}

extension ThenableTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ThenableTests = [
        ("testBarrier", testBarrier),
        ("testCompactMap", testCompactMap),
        ("testCompactMapThrows", testCompactMapThrows),
        ("testCompactMapValues", testCompactMapValues),
        ("testDispatchFlagsSyntax", testDispatchFlagsSyntax),
        ("testFirstValueForEmpty", testFirstValueForEmpty),
        ("testGet", testGet),
        ("testLastValueForEmpty", testLastValueForEmpty),
        ("testPMKErrorCompactMap", testPMKErrorCompactMap),
        ("testRejectedPromiseCompactMap", testRejectedPromiseCompactMap),
        ("testThenFlatMap", testThenFlatMap),
        ("testThenMap", testThenMap),
        ("testThenOffRejected", testThenOffRejected),
    ]
}

extension WhenConcurrentTestCase_Swift {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__WhenConcurrentTestCase_Swift = [
        ("testStopsDequeueingOnceRejected", testStopsDequeueingOnceRejected),
        ("testWhen", testWhen),
        ("testWhenConcurrency", testWhenConcurrency),
        ("testWhenConcurrencyLessThanZero", testWhenConcurrencyLessThanZero),
        ("testWhenEmptyGenerator", testWhenEmptyGenerator),
        ("testWhenGeneratorError", testWhenGeneratorError),
    ]
}

extension WhenTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__WhenTests = [
        ("testAllSealedRejectedFirstOneRejects", testAllSealedRejectedFirstOneRejects),
        ("testDoubleTuple", testDoubleTuple),
        ("testEmpty", testEmpty),
        ("testGuaranteeWhen", testGuaranteeWhen),
        ("testInt", testInt),
        ("testProgress", testProgress),
        ("testProgressDoesNotExceed100Percent", testProgressDoesNotExceed100Percent),
        ("testQuadrupleTuple", testQuadrupleTuple),
        ("testQuintupleTuple", testQuintupleTuple),
        ("testRejected", testRejected),
        ("testTripleTuple", testTripleTuple),
        ("testUnhandledErrorHandlerDoesNotFire", testUnhandledErrorHandlerDoesNotFire),
        ("testUnhandledErrorHandlerDoesNotFireForStragglers", testUnhandledErrorHandlerDoesNotFireForStragglers),
        ("testVoid", testVoid),
    ]
}

extension WrapTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__WrapTests = [
        ("testError", testError),
        ("testInvalidCallingConvention", testInvalidCallingConvention),
        ("testInvertedCallingConvention", testInvertedCallingConvention),
        ("testIsFulfilled", testIsFulfilled),
        ("testNonOptionalFirstParameter", testNonOptionalFirstParameter),
        ("testPendingPromiseDeallocated", testPendingPromiseDeallocated),
        ("testSuccess", testSuccess),
        ("testVoidCompletionValue", testVoidCompletionValue),
        ("testVoidResolverFulfillAmbiguity", testVoidResolverFulfillAmbiguity),
    ]
}

extension ZalgoTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ZalgoTests = [
        ("test1", test1),
        ("test2", test2),
        ("test3", test3),
        ("test4", test4),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AfterTests.__allTests__AfterTests),
        testCase(CancellationTests.__allTests__CancellationTests),
        testCase(CatchableTests.__allTests__CatchableTests),
        testCase(ChainDispatcherTests.__allTests__ChainDispatcherTests),
        testCase(DispatchWrapperTests.__allTests__DispatchWrapperTests),
        testCase(DispatcherTests.__allTests__DispatcherTests),
        testCase(DispatcherTypeTests.__allTests__DispatcherTypeTests),
        testCase(GuaranteeTests.__allTests__GuaranteeTests),
        testCase(HangTests.__allTests__HangTests),
        testCase(JoinTests.__allTests__JoinTests),
        testCase(LoggingTests.__allTests__LoggingTests),
        testCase(PMKDefaultDispatchQueueTest.__allTests__PMKDefaultDispatchQueueTest),
        testCase(PMKErrorTests.__allTests__PMKErrorTests),
        testCase(PromiseTests.__allTests__PromiseTests),
        testCase(RaceTests.__allTests__RaceTests),
        testCase(RegressionTests.__allTests__RegressionTests),
        testCase(StressTests.__allTests__StressTests),
        testCase(ThenableTests.__allTests__ThenableTests),
        testCase(WhenConcurrentTestCase_Swift.__allTests__WhenConcurrentTestCase_Swift),
        testCase(WhenTests.__allTests__WhenTests),
        testCase(WrapTests.__allTests__WrapTests),
        testCase(ZalgoTests.__allTests__ZalgoTests),
    ]
}
#endif
