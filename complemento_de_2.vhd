-- Descrição: Este arquivo VHDL define uma entidade "complemento_de_2" que realiza a operação de complemento de dois em um vetor de bits de 8 bits.

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity complemento_de_2 is
    port (
        Entrada : in std_logic_vector(7 downto 0);  -- Porta de entrada representando o número original
        Saida   : out std_logic_vector(7 downto 0)  -- Porta de saída com o resultado do complemento de dois
    );
end complemento_de_2;

architecture comportamento of complemento_de_2 is
    signal Temp: std_logic_vector(7 downto 0);  -- Variável temporária para armazenar o complemento de dois
begin
    Temp <= not Entrada;  -- Inverte todos os bits de Entrada (complemento de um)
    Saida <= std_logic_vector(unsigned(Temp) + 1) after 10 ns;  -- Adiciona 1 ao complemento de um para obter o complemento de dois
end comportamento;
