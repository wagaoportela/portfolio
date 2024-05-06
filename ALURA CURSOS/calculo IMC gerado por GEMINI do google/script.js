function calcularIMC() {
  // Obter valores de peso e altura
  const peso = parseFloat(document.getElementById("peso").value);
  const altura = parseFloat(document.getElementById("altura").value);

  // Calcular IMC
  const imc = peso / (altura * altura);

  // Exibir resultado
  let resultado = document.getElementById("resultado");
  resultado.textContent = "Seu IMC é: " + imc.toFixed(2);
}