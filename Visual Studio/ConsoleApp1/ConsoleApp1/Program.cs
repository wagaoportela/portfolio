namespace ConsoleApp1
{
    class Program
    { 
        static void Main(string[] args)
        {
            Console.WriteLine("Teste Console");
            Console.WriteLine("Teste Console2");
            Console.WriteLine("Meu Nome");
            var name = Console.ReadLine();
            var currentDate = DateTime.Now;
            Console.WriteLine($"{Environment.NewLine}Olá, {name}, sobre {currentDate:d} at {currentDate:t}!");
            Console.Write($"{Environment.NewLine}Pressione qualquer tecla para sair...");
            Console.ReadKey(true);
        }
    }
}