using Xunit;
using System.Collections.Generic;
using System.Linq;

/// <summary>
/// Unit tests for The Celestial Alignment of Lumoria.
/// Tests the light intensity calculations for planets in the Lumoria system.
/// </summary>
public class LumoriaTests
{
    [Fact]
    public void GetLightIntensity_FirstPlanet_ReturnsFull()
    {
        // The closest planet to the star is never shadowed
        var result = Lumoria.GetLightIntensity(0, 0);
        Assert.Equal("Full", result);
    }

    [Fact]
    public void GetLightIntensity_MultipleShadows_ReturnsNoneMultipleShadows()
    {
        // A planet behind more than one larger planet receives no light
        var resultOne = Lumoria.GetLightIntensity(1, 1);
        var resultMany = Lumoria.GetLightIntensity(2, 3);
        Assert.Equal("None", resultOne);
        Assert.Equal("None (Multiple Shadows)", resultMany);
    }

    [Fact]
    public void CalculateLightIntensity_WithSampleData_ReturnsExpectedResults()
    {
        // Planets sorted by distance: Mercuria, Venusia, Earthia, Marsia
        var planets = new List<Planet>
        {
            new Planet { Name = "Mercuria", Distance = 0.4, Size = 4879 },
            new Planet { Name = "Venusia", Distance = 0.7, Size = 12104 },
            new Planet { Name = "Earthia", Distance = 1.0, Size = 12742 },
            new Planet { Name = "Marsia", Distance = 1.5, Size = 6779 }
        };

        var results = Lumoria.CalculateLightIntensity(planets);

        Assert.Equal("Full", results.First(r => r.Name == "Mercuria").Light);
        Assert.Equal("Partial", results.First(r => r.Name == "Venusia").Light);
        Assert.Equal("Partial", results.First(r => r.Name == "Earthia").Light);
        Assert.Equal("None (Multiple Shadows)", results.First(r => r.Name == "Marsia").Light);
    }
}
