// See https://aka.ms/new-console-template for more information
using System.Collections.Specialized;

string mensagemDeBoasVindas = "seja bem vindo!";
// List<string> listaDasBandas = new List<string>();
// listaDasBandas = ["skank", "sepultura", "titas" , "Metallica", "AC/DC", "Iron Maiden", "Guns N' Roses", "Led Zeppelin"];
Dictionary<string, List<int>> listaDasBandas = new Dictionary<string, List<int>>();
listaDasBandas.Add("SKANK", new List<int> { 10,10,10 });
listaDasBandas.Add("SEPULTURA", new List<int> { 10, 9, 8 });
listaDasBandas.Add("Linkin Park", new List<int> { 7, 8, 7});
listaDasBandas.Add("AHA", new List<int> ());

Dictionary<string, int> estoqueLoja = new Dictionary<string, int>();

Dictionary<string, List<int>> vendasCarros = new Dictionary<string, List<int>> {
    { "Bugatti Veyron", new List<int> { 10, 15, 12, 8, 5 } },
    { "Koenigsegg Agera RS", new List<int> { 2, 3, 5, 6, 7 } },
    { "Lamborghini Aventador", new List<int> { 20, 18, 22, 24, 16 } },
    { "Pagani Huayra", new List<int> { 4, 5, 6, 5, 4 } },
    { "Ferrari LaFerrari", new List<int> { 7, 6, 5, 8, 10 } }
};

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

void AvaliarUmaBanda()
{
    //digite qual banda deseja avaliar
    // se a banda existir no dicionario >> atribuir uma nota
    // senão, volta ao menu principal
    Console.Clear();
    ExibirTitulo("Avaliar banda");

    string nomeDaBanda = Console.ReadLine()!; // exclamação para não aceitar nulo
    if (listaDasBandas.ContainsKey(nomeDaBanda))
    {
        Console.Write($"Qual a nota que a banda {nomeDaBanda} merece: ");
        int nota = int.Parse(Console.ReadLine()!);
        listaDasBandas[nomeDaBanda].Add(nota);
        Console.WriteLine($"\nA nota {nota} foi registrada com sucesso para a banda {nomeDaBanda}");
        Thread.Sleep(2000);
        Console.Clear();
        ExibirOpcoesMenu();
    }
    else
    {
        Console.WriteLine($"\nA banda {nomeDaBanda} não foi encontrada!");
        Console.WriteLine("Digite uma tecla para voltar ao menu principal");
        Console.ReadKey();
        Console.Clear();
        ExibirOpcoesMenu();
    }

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
    Console.WriteLine("Digite 3 para exibir somente numeros pares de uma lista");
    Console.WriteLine("Digite 4 para gerenciar notas alunos escola de programação");
    Console.WriteLine("Digite 5 Controlar estoque de loja, produto e quantidade loja");


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
        case 4:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            GerenciarNotasAlunos();
            SubMenuCalculos();
            break;
        case 5:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            EstoqueLoja();
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

void EstoqueLoja()
{
    ExibirTitulo("Exibir estoque loja");

    Console.WriteLine("1 para inserir produto e estoque");
    Console.WriteLine("2 para ver produtos");
    Console.WriteLine("-1 para sair e voltar menu anterior");
    string opcao = Console.ReadLine()!;
    int numopcao = int.Parse(opcao);

    switch (numopcao) 
    {
        case 1 : Console.Write("\nInforme o nome do produto: ");
            string nomeProduto = Console.ReadLine()!;
            Console.Write("\nInforme a quantidade em estoque do prod1uto: ");
            int qtdProduto = int.Parse(Console.ReadLine());
            estoqueLoja.Add(nomeProduto, qtdProduto);

            Console.WriteLine($"\nProduto: {nomeProduto} e quantidade: {qtdProduto} adicionado ao estoque");
            Console.WriteLine($"\nPressione qualquer tecla para voltar ao menu");
            Console.ReadKey();
            Console.Clear();    
            EstoqueLoja();
            break;
        case 2 : Console.WriteLine("\nLista de produtos:");
            Console.WriteLine("produto\t\t\tQuantidade");
            Console.WriteLine("=====================================");
            foreach (string produto in estoqueLoja.Keys)
            {
                Console.Write(produto + "\t\t");
                Console.WriteLine(estoqueLoja[produto]);

            }
            Thread.Sleep(2000);
            Console.Clear();
            EstoqueLoja();
            break;
        case -1 :

            SubMenuCalculos();
            break;
        default : Console.WriteLine("opção inválida");
            Thread.Sleep(2000);
            Console.Clear();
            EstoqueLoja();
            break;
    }



    Console.WriteLine("Informe Nome produto");

    Console.WriteLine("Pressione qualquer tecla para voltar ao menu");
    Console.ReadKey();

}

void GerenciarNotasAlunos()
{
    ExibirTitulo("Gerenciar notas alunos");

    var notasAlunos = new Dictionary<string, Dictionary<string, List<int>>> {
    { "Ana", new Dictionary<string, List<int>> {
        { "C#", new List<int> { 8, 7, 6 } },
        { "Java", new List<int> { 7, 6, 5 } },
        { "Python", new List<int> { 9, 8, 8 } }
    }},
    { "Maria", new Dictionary<string, List<int>> {
        { "C#", new List<int> { 6, 5, 4 } },
        { "Java", new List<int> { 8, 7, 6 } },
        { "Python", new List<int> { 6, 10, 5 } }
    }},
    { "Luiza", new Dictionary<string, List<int>> {
        { "C#", new List<int> { 2, 3, 10 } },
        { "Java", new List<int> { 8, 8, 8 } },
        { "Python", new List<int> { 7, 7, 7 } }
    }}
    };

    List<int> notasPythonMaria = notasAlunos["Maria"]["Python"];
    double mediaMariaEmPython = notasPythonMaria.Average();
    Console.WriteLine($"Media notas maria em python {mediaMariaEmPython}");
    Console.WriteLine("Pressione qualquer tecla para voltar ao menu");
    Console.ReadKey();


}

void ExibirOpcoesMenu()
{
    ExibirMensagemBoasVindas();
    Console.WriteLine("");
    Console.WriteLine("Digite 1 para registrar uma banda");
    Console.WriteLine("Digite 2 para mostrar todas as bandas");
    Console.WriteLine("Digite 3 para avaliar uma banda");
    Console.WriteLine("Digite 4 para exibir a media de uma banda");
    Console.WriteLine("digite 6 para ver media venda carros");
    Console.WriteLine("digite 7 para Login Simulação");
    Console.WriteLine("Digite 8 para quiz ");
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
            AvaliarUmaBanda();
            break;
        case 4:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            MediaBanda();
            break;
        case 6:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            MediaVendaCarros();
            break;
        case 7:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            LoginSimulacao();
            break;            
        case 8:
            Console.WriteLine("Você escolheu " + opcaoEscolhidaNum);
            quiz();
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

void MediaBanda()
{
    Console.Clear();
    ExibirTitulo("Media notas das bandas");

    Console.Write("\nDigite VER para ver a media de notas de todas as bandas");
    Console.Write("\nou informe a banda que vc quer ver as notas e medias: ");
    string nomeBanda = Console.ReadLine()!;

    if (nomeBanda.ToUpper() == "VER")
    {
        // ver notas e medias de todas as bandas
        Console.WriteLine("Banda\t\t\tNotas\t\t\tMédias");
        Console.WriteLine("=================================================");
        foreach (string nmBanda in listaDasBandas.Keys)
        {
            Console.Write(nmBanda+"\t\t");
            // notas
            Console.WriteLine(fNotas(listaDasBandas[nmBanda]));
            // médias

        }
        Console.WriteLine("\npressione qualquer tecla");
        Console.ReadKey();
        ExibirOpcoesMenu();

    }

    if (listaDasBandas.ContainsKey(nomeBanda) == false) {
        Console.WriteLine("Banda não está na lista, favor digitar novamente");
        Thread.Sleep(2000);
        MediaBanda();
    }
    Console.WriteLine("\nBanda: " + nomeBanda.ToUpper());
    Console.Write("Notas e Média: ");

    //pegar notas da banda
    string vNotasEMediaBanda = fNotas(listaDasBandas[nomeBanda]);
    Console.WriteLine(vNotasEMediaBanda) ;

    Console.WriteLine("pressione qualquer tecla");
    Console.ReadKey();

    ExibirOpcoesMenu();

}


static string fNotas(List<int> notas)
{
    string Retorno = "";

    //pegar notas da banda
    int qtdNotas = 0;
    string vNotas = " [";
    // List<int> notasBanda = listaDasBandas[nomeBanda];
    foreach (int nota in notas)
    {
        qtdNotas++;
        vNotas += nota + " ";
    }
    vNotas = vNotas.TrimEnd() + "] ";

    if (qtdNotas == 0)
    {
        Retorno = " [SEM NOTAS]      ";
    } else
    {
        double mediaNota = notas.Average();
        Retorno = vNotas + "    [" + mediaNota.ToString()+"]" ;
    }

    return Retorno;
}

void MediaVendaCarros()
{
    Console.Clear();
    ExibirTitulo("Media venda de carros");

    Console.WriteLine("Carro\t\t\tMédia");
    Console.WriteLine("================================");

    foreach (string carro in vendasCarros.Keys)
    {
        Console.Write(carro + "\t\t");
        List<int> valorvenda = vendasCarros[carro];

        double mediaVenda = valorvenda.Average();
        Console.WriteLine(mediaVenda);

    }

    Console.ReadKey();
}

void LoginSimulacao()
{
    Dictionary<string, string> usuarios = new Dictionary<string, string>
    {
        { "user1", "senha123" },
        { "user2", "abc456" },
        // Adicione mais usuários conforme necessário
    };

    string nomeUsuario = "user1";
    string senha = "senha123";

    Console.Write("Informe usuario: ");
    nomeUsuario = Console.ReadLine()!;
    Console.Write("\nInforme a senha: ");
    senha = Console.ReadLine()!;


    if (usuarios.ContainsKey(nomeUsuario) && usuarios[nomeUsuario] == senha)
        Console.WriteLine("Login bem-sucedido!");
    else
        Console.WriteLine("Nome de usuário ou senha incorretos.");

    Console.ReadKey();
}

void quiz()
{
    ExibirTitulo("Quiz");

    Dictionary<string, string> perguntasERespostas = new Dictionary<string, string>
    {
        { "Qual é a capital do Brasil?", "Brasília" },
        { "Quanto é 7 vezes 8?", "56" },
        { "Quem escreveu 'Romeu e Julieta'?", "William Shakespeare" },
        // Adicione mais perguntas e respostas conforme necessário
    };

        int pontuacao = 0;

        foreach (var pergunta in perguntasERespostas)
        {
            Console.WriteLine(pergunta.Key);
            Console.Write("Sua resposta: ");
            string respostaUsuario = Console.ReadLine()!;

            if (respostaUsuario.ToLower() == pergunta.Value.ToLower())
            {
                Console.WriteLine("Correto!\n");
                pontuacao++;
            }
            else
            {
                Console.WriteLine($"Incorreto. A resposta correta é: {pergunta.Value}\n");
            }
        }

        Console.WriteLine($"Pontuação final: {pontuacao} de {perguntasERespostas.Count}");
    Console.ReadKey();
    ExibirOpcoesMenu();


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

    // listaDasBandas.Add(nomeDaBanda);
    listaDasBandas.Add(nomeDaBanda, new List<int> ());

    Console.WriteLine("\nBanda: " + nomeDaBanda + " registrada" );
    Thread.Sleep(3000);
    Console.Clear();
    ExibirOpcoesMenu();
}

void MostrarBandas()
{
    ExibirTitulo("Bandas Registradas:");

    foreach (var banda in listaDasBandas.Keys)
    {
        Console.WriteLine($"{banda.ToUpper()}");
    }
    Console.WriteLine("\nMostrou bandas com comando foreach\n\n");
    Thread.Sleep(2000);
    /*
    for (int i = 0; i < listaDasBandas.Keys.Count; i++)
    {
        Console.WriteLine($"{(i+1)} : {listaDasBandas.Keys.[i].ToUpper()}");
    }
    Console.WriteLine("\nMostrou bandas com comando for");
    Thread.Sleep(2000);
    */

    /*
    int j = 0;
    do
    {
        Console.WriteLine($"{(j + 1)} : {listaDasBandas[j].ToUpper()}");
        j++;
    } while ( j < listaDasBandas.Count );
    Console.WriteLine("\nMostrou bandas com comando WHILE");

    Console.WriteLine("Pressione qualquer tecla para voltar para o menu principal");
    Console.ReadKey();
    */

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

