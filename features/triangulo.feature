# encoding: utf-8
# language: pt

Funcionalidade: Triângulo

  Esquema do Cenário: Validando os lados triângulo
    Dado que carreguei o aplicativo
    E preencher o lado A com o valor '<Lado A>'
    E preencher o lado B com o valor '<Lado B>'
    E preencher o lado C com o valor '<Lado C>'
    Quando selecionar a opção validar
    Então espero ver a seguinte mensagem de validação '<Mensagem>'

    Exemplos: De preenchimento válido
    Valores positivos e maiores que 0
      | Lado A | Lado B | Lado C | Mensagem             |
      | 1      | 1      | 1      | Triângulo Equilátero |
      | 1      | 1      | 3      | Triângulo Isósceles  |
      | 1      | 2      | 3      | Triângulo Escaleno   |

    Exemplos: De preenchimento inválidos
    Caracteres especiais e números negativos
      | Lado A | Lado B | Lado C | Mensagem                                                       |
      |        | 1      | 1      | Somente digitos números inteiros e maiores que '0' são aceitos |
      | 1      |        | 1      | Somente digitos números inteiros e maiores que '0' são aceitos |
      | 1      | 1      |        | Somente digitos números inteiros e maiores que '0' são aceitos |
      | a      | 1      | 1      | Somente digitos números inteiros e maiores que '0' são aceitos |
      | 1      | a      | 1      | Somente digitos números inteiros e maiores que '0' são aceitos |
      | 1      | 1      | a      | Somente digitos números inteiros e maiores que '0' são aceitos |
      | @      | 1      | 1      | Somente digitos números inteiros e maiores que '0' são aceitos |
      | 1      | @      | 1      | Somente digitos números inteiros e maiores que '0' são aceitos |
      | 1      | 1      | @      | Somente digitos números inteiros e maiores que '0' são aceitos |
      | - 1    | 1      | 1      | Somente digitos números inteiros e maiores que '0' são aceitos |
