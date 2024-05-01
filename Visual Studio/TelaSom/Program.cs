// See https://aka.ms/new-console-template for more information
using System.Collections.Specialized;

string mensagemDeBoasVindas = "seja bem vindo!";
List<string> listaDasBandas = new List<string>();
listaDasBandas = ["skank", "sepultura", "titas" , "Metallica", "AC/DC", "Iron Maiden", "Guns N' Roses", "Led Zeppelin"];


void ExibirMensagemBoasVindas()
{

    Console.Clear();
    Console.WriteLine("████████╗███████╗██╗░░░░░░█████╗░  ██████╗░███████╗  ░██████╗░█████╗░███╗░░░███╗");
    Console.WriteLine("╚══██╔══╝██╔════╝██║░░░░░██╔══██╗  ██╔══██╗██╔════╝  ██╔════╝██╔══██╗████╗░████║");
    Console.WriteLine("░░░██║░░░█████╗░░██║░░░░░███████║  ██║░░██║█████╗░░  ╚█████╗░██║░░██║██╔████╔██║");
    Console.WriteLine("░░░██║░░░██╔══╝░░██║░░░░░██╔══██║  ██║░░██║██╔══╝░░  ░╚═══██╗██║░░██║██║╚██╔╝██║");
    Console.WriteLine("░░░██║░░░███████╗███████╗██║░░██║  ██████╔╝███████╗  ██████╔╝╚█████╔╝██║░╚═╝░██║");
    Console.WriteLine("░░░╚═╝░░░╚══════╝╚══════╝╚═╝░░╚═╝  ╚═════╝░╚══════╝  ╚═════╝░░╚════╝░╚═╝░░░░░╚═╝");
    Console.WriteLine(mensagemDeBoasVindas);

}

void ExibirTitulo(string nomeTitulo)
{
    int qtdLetras = nomeTitulo.Length;
    // string linhaBarra = new string('=', qtdLetras);
    Console.Clear();
    string linhaBarra = string.Empty.PadLeft(qtdLetras,'=');
    Console.WriteLine(linhaBarra);
    Console.WriteLine(nomeTitulo);
    Console.WriteLine(linhaBarra+"\n");
}

void CalculaNota()
{
    ExibirTitulo("Calcula Nota");
    int notaMedia = 0;
    notaMedia = 7;

    if (notaMedia >= 5)
    {
        Console.WriteLine("Nota suficiente para aprovação");
    }
    else
    {
        Console.WriteLine("aprovado");
    }

    List<string> linguagens = ["C#","Java","JavaScript","pos3","pos4","pos5","pos6","pos7","pos8","pos9","pos10"];
    Console.WriteLine("primeira linguagem: " + linguagens[0] + "\n\nAgora escolha de 0 a 10:");

    string item = Console.ReadLine()!;
    
    int posicao = int.Parse(item);
    Console.WriteLine("\nvocê escolheu: " + linguagens[posicao]);



}

void SubMenuCalculos()
{
    ExibirTitulo("subMenu Cálculos");

    Console.WriteLine("Digite 1 para cacular operações básicas");
    Console.WriteLine("Digite 2 para Somar valores inteiros de uma lista");
    Console.WriteLine("Digite 3 para exibir somente numeroes pares de uma lista");

    Console.WriteLine("Digite -1 para voltar ao menu anterior");

    Console.WriteLine("\nDigite a sua opção: ");
    string opcaoEscolhida = Console.ReadLine()!;
    int opcaoEscolhidaNum = int.Parse(opcaoEscolhida);

    Console.WriteLine("opção: " + opcaoEscolhidaNum);
    switch (opcaoEscolhidaNum)
    {
        case 1:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            OperacoesBasicas();
            SubMenuCalculos();
            break;
        case 2:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            somaValIntLista();
            SubMenuCalculos();
            break;
        case 3:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            ExibirNumPares();
            SubMenuCalculos();
            break;
        case -1:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            ExibirOpcoesMenu();
            break;
        default:
            Console.WriteLine("opção invalida");
            break;
    }
}

void ExibirOpcoesMenu()
{
    ExibirMensagemBoasVindas();
    Console.WriteLine("");
    Console.WriteLine("Digite 1 para registrar uma banda");
    Console.WriteLine("Digite 2 para mostrar todas as bandas");
    Console.WriteLine("Digite 3 para avaliar uma banda");
    Console.WriteLine("Digite 4 para exibir a media de uma banda");
    Console.WriteLine("Digite 9 SubMenu Cálculos");

    Console.WriteLine("Digite -1 para sair");

    Console.WriteLine("\nDigite a sua opção: ");
    string opcaoEscolhida = Console.ReadLine()!;
    int opcaoEscolhidaNum = int.Parse(opcaoEscolhida);
    
    Console.WriteLine("opção: " + opcaoEscolhidaNum);
    switch (opcaoEscolhidaNum)
    { 
        case 1:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            RegistrarBanda();
            break;
        case 2:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            MostrarBandas();
            break;
        case 3:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            CalculaNota();
            break;
        case 4:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            break;
        case 9:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            SubMenuCalculos();
            break;
        case -1:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            break;
        default:
            Console.WriteLine("opção invalida");
            break;
    }
}

void ExibirNumPares()
{
    ExibirTitulo("Exibir numeros pares de uma lista");

    List<int> listaNumeros = new List<int>();
    listaNumeros = [1,2,3,4,5,6,7,8,9,10,11,12,12,13,13,14,14];

    foreach ( int numero in listaNumeros)
    {
        if ((numero % 2) == 0) // par 
        {
            Console.Write(numero + " ");
        }
    }
    Console.WriteLine("\nResultados numeros pares acima com foreach, pressione qualquer teclar para continuar");
    Console.ReadKey();

    Console.WriteLine("\n\nAbaixo numeros impares:");

    for (int i = 0; i < listaNumeros.Count; i++)
    {
        if (listaNumeros[i] % 2 != 0) // Verifica se o número é impar
        {
            Console.Write(listaNumeros[i] + " ");
        }
    }
    Console.WriteLine("\nResultados numeros impares acima com for, pressione qualquer teclar para voltar ao menu principal");
    Console.ReadKey();

    // ExibirOpcoesMenu();

}

void OperacoesBasicas()
{
    float vlA = 3.334f;
    float vlB = 4.533f;

    ExibirTitulo($"Operações básicas com os valores A: {vlA} e B: {vlB}");

    Console.WriteLine($"Adição   : A + B: {vlA + vlB}");
    Console.WriteLine($"Subtração: A + B: {vlA - vlB}");

    Console.WriteLine($"Multiplicação: A * B: {vlA * vlB}");
    Console.WriteLine($"Divisão      : A / B: {vlA / vlB}");

    Console.WriteLine("\nResultados acima, pressione qualquer teclar para voltar ao menu principal");
    Console.ReadKey();

    // ExibirOpcoesMenu();

}


void RegistrarBanda()
{
    ExibirTitulo("Registro de Bandas");

    Console.Write("Digite o nome da Banda que deseja registrar: ");
    string nomeDaBanda = Console.ReadLine()!;

    Console.WriteLine("\nBanda: " + nomeDaBanda + " registrada" );
    listaDasBandas.Add(nomeDaBanda);
    Thread.Sleep(3000);
    Console.Clear();
    ExibirOpcoesMenu();
}

void MostrarBandas()
{
    ExibirTitulo("Bandas Registradas:");

    foreach (var banda in listaDasBandas)
    {
        Console.WriteLine($"{banda.ToUpper()}");
    }
    Console.WriteLine("\nMostrou bandas com comando foreach\n\n");
    Thread.Sleep(2000);

    for (int i = 0; i < listaDasBandas.Count; i++)
    {
        Console.WriteLine($"{(i+1)} : {listaDasBandas[i].ToUpper()}");
    }
    Console.WriteLine("\nMostrou bandas com comando for");
    Thread.Sleep(2000);

    int j = 0;
    do
    {
        Console.WriteLine($"{(j + 1)} : {listaDasBandas[j].ToUpper()}");
        j++;
    } while ( j < listaDasBandas.Count );
    Console.WriteLine("\nMostrou bandas com comando WHILE");

    Console.WriteLine("Pressione qualquer tecla para voltar para o menu principal");
    Console.ReadKey();

    ExibirOpcoesMenu();

}

void somaValIntLista()
{
    ExibirTitulo("Exibir numeros de uma lista");

    List<int> numeros = new List<int> { 1, 2, 3, 4, 5 };
    int soma = 0;

    Console.WriteLine("\nnumeros da lista:");
    foreach (int numero in numeros)
    {
        Console.Write(numero + "  ");
        soma += numero;
    }

    Console.WriteLine($"\nA soma dos elementos da lista é: {soma}");

    Console.WriteLine("\nPressione qualquer tecla para voltar para o menu principal");
    Console.ReadKey();

    // ExibirOpcoesMenu();
}

//ExibirMensagemBoasVindas();
ExibirOpcoesMenu();

