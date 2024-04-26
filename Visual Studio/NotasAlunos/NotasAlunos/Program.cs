// See https://aka.ms/new-console-template for more information
// initialize variables - graded assignments 
int currentAssignments = 5;

int sophia1 = 93;
int sophia2 = 87;
int sophia3 = 98;
int sophia4 = 95;
int sophia5 = 100;
int sophiaSoma = 0;
decimal sophiaMedia = 0;
string sophiaScore;

int nicolas1 = 80;
int nicolas2 = 83;
int nicolas3 = 82;
int nicolas4 = 88;
int nicolas5 = 85;
int nicolasSoma = 0;
decimal nicolasMedia = 0;
string nicolasScore;

int zahirah1 = 84;
int zahirah2 = 96;
int zahirah3 = 73;
int zahirah4 = 85;
int zahirah5 = 79;
int zahirahSoma = 0;
decimal zahirahMedia = 0;
string zahirahScore;


int jeong1 = 90;
int jeong2 = 92;
int jeong3 = 98;
int jeong4 = 100;
int jeong5 = 97;
int jeongSoma = 0;
decimal jeongMedia = 0;
string jeongScore;

// Calcular a soma das notas de tarefa de cada aluno
sophiaSoma = sophia1 + sophia2 + sophia3 + sophia4 + sophia5;
nicolasSoma = nicolas1 + nicolas2 + nicolas3 + nicolas4 + nicolas5;
zahirahSoma = zahirah1 + zahirah2 + zahirah3 + zahirah4 + zahirah5;
jeongSoma = jeong1 + jeong2 + jeong3 + jeong4 + jeong5;


//exibir asoma das notas
Console.WriteLine("sophia: " + sophiaSoma);
Console.WriteLine("nicolas: " + nicolasSoma);
Console.WriteLine("zahirah: " + zahirahSoma);
Console.WriteLine("jeong: " + jeongSoma);
Console.WriteLine("\nMédias:");
Console.WriteLine("========\n");


// Calcular a media das notas de tarefa de cada aluno
sophiaMedia = (sophia1 + sophia2 + sophia3 + sophia4 + sophia5) / currentAssignments;
nicolasMedia = (nicolas1 + nicolas2 + nicolas3 + nicolas4 + nicolas5) / currentAssignments;
zahirahMedia = (zahirah1 + zahirah2 + zahirah3 + zahirah4 + zahirah5) / currentAssignments;
jeongMedia = (jeong1 + jeong2 + jeong3 + jeong4 + jeong5)  / currentAssignments;
// ou // tem que converter para decimal
sophiaMedia = ((decimal)sophiaSoma) / currentAssignments;
nicolasMedia = ((decimal)nicolasSoma) / currentAssignments;
zahirahMedia = ((decimal)zahirahSoma) / currentAssignments;
jeongMedia = ((decimal)jeongSoma) / currentAssignments;


//exibir a media das notas
Console.WriteLine("Media sophia: " + sophiaMedia + " A");
Console.WriteLine("Media nicolas: " + nicolasMedia + " B");
Console.WriteLine("Media zahirah: " + zahirahMedia + " B");
Console.WriteLine("Media jeong: " + jeongMedia + " A");

//exibir a media das notas formatado com caracteres scape
Console.WriteLine("Grade\t\tEstudantes\n");
Console.WriteLine("Media sophia:\t\t" + sophiaMedia + "\tA");
Console.WriteLine("Media nicolas:\t" + nicolasMedia + "\tB");
Console.WriteLine("Media zahirah:\t" + zahirahMedia + "\tB");
Console.WriteLine("Media jeong:\t\t" + jeongMedia + "\tA");

