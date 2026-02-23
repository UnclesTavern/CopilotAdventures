using System;
using System.Collections.Generic;

/// <summary>
/// Unit Tests for The Clockwork Town of Tempora
/// 
/// This test suite validates time synchronization logic, time parsing, 
/// and clock difference calculation functionality.
/// </summary>
public class TemporaTests
{
    private class TestResults
    {
        public int Passed { get; set; } = 0;
        public int Failed { get; set; } = 0;
        public List<string> Errors { get; set; } = new();

        public void AssertEquals<T>(T actual, T expected, string message)
        {
            if (EqualityComparer<T>.Default.Equals(actual, expected))
            {
                Console.WriteLine($"✅ PASS: {message}");
                Passed++;
            }
            else
            {
                Console.WriteLine($"❌ FAIL: {message} - Expected {expected}, got {actual}");
                Failed++;
                Errors.Add($"{message} - Expected {expected}, got {actual}");
            }
        }

        public void AssertListEquals<T>(List<T> actual, List<T> expected, string message)
        {
            bool equal = actual.Count == expected.Count;
            if (equal)
            {
                for (int i = 0; i < actual.Count; i++)
                {
                    if (!EqualityComparer<T>.Default.Equals(actual[i], expected[i]))
                    {
                        equal = false;
                        break;
                    }
                }
            }

            if (equal)
            {
                Console.WriteLine($"✅ PASS: {message}");
                Passed++;
            }
            else
            {
                Console.WriteLine($"❌ FAIL: {message} - Expected [{string.Join(", ", expected)}], got [{string.Join(", ", actual)}]");
                Failed++;
                Errors.Add($"{message} - Expected [{string.Join(", ", expected)}], got [{string.Join(", ", actual)}]");
            }
        }
    }

    // ============================================================================
    // TIME DIFFERENCE CALCULATION TESTS
    // ============================================================================

    private static void TestTimeDifferenceCalculation(TestResults testResults)
    {
        Console.WriteLine("\n🧪 Testing time difference calculation...");

        // Test basic time differences
        testResults.AssertEquals(Tempora.TimeDifference("15:05", "15:00"), 5, 
            "Clock ahead by 5 minutes should return +5");
        
        testResults.AssertEquals(Tempora.TimeDifference("14:45", "15:00"), -15, 
            "Clock behind by 15 minutes should return -15");
        
        testResults.AssertEquals(Tempora.TimeDifference("15:00", "15:00"), 0, 
            "Synchronized clocks should return 0");

        Console.WriteLine("✅ All time difference tests passed!");
    }

    // ============================================================================
    // CLOCK SYNCHRONIZATION TESTS
    // ============================================================================

    private static void TestSynchronizeClocks(TestResults testResults)
    {
        Console.WriteLine("\n🧪 Testing clock synchronization...");

        var clockTimes = new List<string> { "14:45", "15:05", "15:00", "14:40" };
        var grandClockTime = "15:00";
        var expected = new List<int> { -15, 5, 0, -20 };
        
        var result = Tempora.SynchronizeClocks(clockTimes, grandClockTime);
        testResults.AssertListEquals(result, expected, 
            "Default scenario should return [-15, 5, 0, -20]");

        Console.WriteLine("✅ Clock synchronization test passed!");
    }

    // ============================================================================
    // EDGE CASE TESTS
    // ============================================================================

    private static void TestEdgeCases(TestResults testResults)
    {
        Console.WriteLine("\n🧪 Testing edge cases...");

        // Hour boundary test
        testResults.AssertEquals(Tempora.TimeDifference("14:00", "15:00"), -60, 
            "One hour difference should return -60 minutes");
        
        testResults.AssertEquals(Tempora.TimeDifference("16:30", "15:00"), 90, 
            "Hour and half ahead should return +90 minutes");
        
        // Empty list test
        var emptyResult = Tempora.SynchronizeClocks(new List<string>(), "12:00");
        testResults.AssertEquals(emptyResult.Count, 0, 
            "Empty clock list should return empty result list");

        Console.WriteLine("✅ All edge case tests passed!");
    }

    // ============================================================================
    // MAIN TEST RUNNER
    // ============================================================================

    public static bool RunAllTests()
    {
        Console.WriteLine("🧪⏰ Starting Test Suite for The Clockwork Town of Tempora ⏰🧪");
        Console.WriteLine("======================================================================");

        var testResults = new TestResults();

        try
        {
            TestTimeDifferenceCalculation(testResults);
            TestSynchronizeClocks(testResults);
            TestEdgeCases(testResults);

            Console.WriteLine("\n===============================================================");
            Console.WriteLine($"📊 Test Results: {testResults.Passed} passed, {testResults.Failed} failed");
            
            if (testResults.Failed == 0)
            {
                Console.WriteLine("🎉 ALL TESTS PASSED! 🎉");
                Console.WriteLine("✅ Time synchronization validated");
                Console.WriteLine("✅ Edge cases covered");
                Console.WriteLine("\nThe Clockwork Town time synchronization is working perfectly!");
            }
            else
            {
                Console.WriteLine("❌ SOME TESTS FAILED");
                foreach (var error in testResults.Errors)
                {
                    Console.WriteLine($"  - {error}");
                }
            }

            return testResults.Failed == 0;
        }
        catch (Exception error)
        {
            Console.WriteLine("\n💥 TEST SUITE FAILED!");
            Console.WriteLine($"Error: {error.Message}");
            return false;
        }
    }
}

// Test runner class
public class TemporaTestRunner
{
    public static void Run()
    {
        var success = TemporaTests.RunAllTests();
        if (!success)
        {
            Environment.Exit(1);
        }
    }
}
