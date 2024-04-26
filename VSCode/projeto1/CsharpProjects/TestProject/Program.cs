// See https://aka.ms/new-console-template for more information

Random dice = new Random();

int roll1 = dice.Next(1, 7);
int roll2 = dice.Next(1, 7);
int roll3 = dice.Next(1, 7);

int total = roll1 + roll2 + roll3;

Console.WriteLine($"Dice roll: {roll1} + {roll2} + {roll3} = {total}");

if (total > 14)
{
    Console.WriteLine("You win!");
}

if (total < 15)
{
    Console.WriteLine("Sorry, you lose.");
}

string message = "The quick brown fox jumps over the lazy dog.";
bool result = message.Contains("dog");
Console.WriteLine(result);

if (message.Contains("fox"))
{
    Console.WriteLine("What does the fox say?");
}

/*
Console.WriteLine("Hello, c#");
Random dice = new Random();
int roll = dice.Next(1, 7);
Console.WriteLine("numero randomico entre 1 e 7 : " + roll);

roll = dice.Next();
int roll2 = dice.Next(101);
int roll3 = dice.Next(50, 101);

Console.WriteLine($"roll : {roll}");
Console.WriteLine($"roll2: {roll2}");
Console.WriteLine($"roll3: {roll3}");

Console.WriteLine("====================\n");


int firstValue = 500;
int secondValue = 600;
int largerValue;


Console.WriteLine("Min: " + Math.Min(firstValue, secondValue) );
Console.WriteLine("Max: " + Math.Max(firstValue,secondValue) );

largerValue = Math.Max(firstValue,secondValue);
Console.WriteLine(largerValue);



Console.WriteLine("\n====================\n");
*/

