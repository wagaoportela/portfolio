// See https://aka.ms/new-console-template for more information
int numeroSecreto = 42;
Random aleatorio = new Random();
numeroSecreto = aleatorio.Next(1, 101);

// laço while para testar se o numero digitado é igual ao numero secreto
do
{
    Console.Write("Digite um número entre 1 e 100: ");
    int chute = int.Parse(Console.ReadLine()!);

    if (chute == numeroSecreto)
    {
        Console.WriteLine("Parabéns! Você acertou o número.");
        break;
    }
    else if (chute < numeroSecreto)
    {
        Console.WriteLine("O número é maior.");
    }
    else
    {
        Console.WriteLine("O número é menor.");
    }

} while (true);


