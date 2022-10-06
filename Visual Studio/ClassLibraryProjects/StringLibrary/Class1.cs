namespace UtilityLibraries;

public static class StringLibrary
{
    public static bool StartsWithUpper(this string? str)
    {
        if (string.IsNullOrWhiteSpace(str))
            return false;

        char ch = str[0];
        return char.IsUpper(ch);
    }


    public static void minhaMsg(string msgStr)
    {
        Console.WriteLine("teste com parametro passado: " + msgStr);
        return ; 
    }

}

