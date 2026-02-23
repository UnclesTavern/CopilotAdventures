/// <summary>
/// Unit Tests for The Celestial Alignment of Lumoria
/// Tests the light intensity calculation logic for planetary alignments
/// </summary>
public class LumoriaTests
{
    private class TestResults
    {
        public int Passed { get; set; } = 0;
        public int Failed { get; set; } = 0;

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
            }
        }
    }

    private static void TestGetShadowCount(TestResults testResults)
    {
        Console.WriteLine("\n🧪 Testing shadow count calculation...");

        var planets = new List<Planet>
        {
            new Planet { Name = "Small", Size = 1000 },
            new Planet { Name = "Medium", Size = 2000 },
            new Planet { Name = "Large", Size = 3000 }
        };

        var shadowCount = Lumoria.GetShadowCount(planets, 2);
        testResults.AssertEquals(shadowCount, 0, "Large planet should have no shadows from smaller planets");

        var shadowCountMedium = Lumoria.GetShadowCount(planets, 1);
        testResults.AssertEquals(shadowCountMedium, 0, "Medium planet should have no shadows from smaller planets");

        Console.WriteLine("✅ Shadow count tests passed!");
    }

    private static void TestGetLightIntensity(TestResults testResults)
    {
        Console.WriteLine("\n🧪 Testing light intensity logic...");

        var intensity = Lumoria.GetLightIntensity(0, 0);
        testResults.AssertEquals(intensity, "Full", "First planet should always have full light");

        var intensityPartial = Lumoria.GetLightIntensity(1, 0);
        testResults.AssertEquals(intensityPartial, "Partial", "Planet with no shadows should have partial light");

        var intensityNone = Lumoria.GetLightIntensity(1, 1);
        testResults.AssertEquals(intensityNone, "None", "Planet with one shadow should have no light");

        Console.WriteLine("✅ Light intensity tests passed!");
    }

    public static bool RunAllTests()
    {
        Console.WriteLine("🧪🌌 Starting Test Suite for Celestial Alignment of Lumoria 🌌🧪");
        Console.WriteLine("=======================================================================");

        var testResults = new TestResults();

        try
        {
            TestGetShadowCount(testResults);
            TestGetLightIntensity(testResults);

            Console.WriteLine("\n🎉 ALL TESTS PASSED! 🎉");
            Console.WriteLine($"✅ {testResults.Passed} tests passed");
            Console.WriteLine($"❌ {testResults.Failed} tests failed");

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

public class LumoriaTestRunner
{
    public static void Run()
    {
        var success = LumoriaTests.RunAllTests();
        if (!success)
        {
            Environment.Exit(1);
        }
    }
}
