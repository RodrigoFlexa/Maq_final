-- Descrição: Este arquivo VHDL define uma entidade "comparador_8_bits" que compara dois vetores de 8 bits
-- e fornece três sinais de saída indicando a igualdade, maior que e menor que.

library ieee;
use ieee.std_logic_1164.all;

entity comparador_8_bits is
    port(
        entrada1, entrada2: in std_logic_vector(7 downto 0);  -- Portas de entrada representando os dois números a serem comparados
        igualdade, maior, menor: out std_logic  -- Portas de saída indicando a relação entre os números
    );
end comparador_8_bits;

architecture modelo_comparador_8_bits of comparador_8_bits is
begin
    igualdade <= '1' when entrada1 = entrada2 else '0';  -- Sinal de saída indicando se os dois números são iguais
    maior <= '1' when entrada1 > entrada2 else '0';  -- Sinal de saída indicando se o primeiro número é maior que o segundo
    menor <= '1' when entrada1 < entrada2 else '0';  -- Sinal de saída indicando se o primeiro número é menor que o segundo
end modelo_comparador_8_bits;
