public class ChamberOfEchoes
{
    static List<int> echoes = new List<int> { 3, 6, 9, 12 };
    static List<int> memories = new List<int>();

    // Predicts the next number in an arithmetic sequence
    // by calculating the common difference and applying it to the last element
    static int PredictNext(List<int> echoes)
    {
        int commonDifference = CalculateCommonDifference(echoes);
        int predictedValue = echoes[echoes.Count - 1] + commonDifference;
        
        StoreSequenceInMemories(echoes, predictedValue);
        
        return predictedValue;
    }

    static int CalculateCommonDifference(List<int> sequence)
    {
        return sequence[1] - sequence[0];
    }

    static void StoreSequenceInMemories(List<int> sequence, int predictedValue)
    {
        memories.AddRange(sequence);
        memories.Add(predictedValue);
    }

    public static void Run()
    {
        Console.WriteLine(PredictNext(echoes));
    }
}