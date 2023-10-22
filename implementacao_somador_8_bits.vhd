-- A entidade "implementacao_somador_8_bits" implementa a adição de dois números de 8 bits, A e B.
-- A saída é a soma (Soma) de 8 bits e um Vai-um que indica se houve carry na adição ou não.

library IEEE;
use IEEE.std_logic_1164.all;

entity implementacao_somador_8_bits is
    port (
        A, B: in std_logic_vector (7 downto 0); -- Dois números de 8 bits a serem somados
        Soma: out std_logic_vector (7 downto 0); -- Saída da adição
        Vai_um: out std_logic -- Vai-um de saída
    );
end implementacao_somador_8_bits;

-- Visão da estrutura do Somador de Meio Bit
architecture comportamento of implementacao_somador_8_bits is

-- Componente interno que implementa a adição de um único bit
component somador_um_bit 
    port (
        A, B, C: in std_logic; 
        Soma, Vai_um: out std_logic
    );
end component;

-- Sinais intermediários para a adição de 8 bits
signal bit_zero, C_0, C_1, C_2, C_3, C_4, C_5, C_6: std_logic;

begin
    -- Inicializa o sinal bit_zero como '0'
    bit_zero <= '0';

    -- Adiciona bit a bit usando o componente somador_um_bit e atualizando os sinais intermediários
    bit_1 : somador_um_bit port map (A(0), B(0), bit_zero, Soma(0), C_0);
    bit_2 : somador_um_bit port map (A(1), B(1), C_0, Soma(1), C_1);
    bit_3 : somador_um_bit port map (A(2), B(2), C_1, Soma(2), C_2);
    bit_4 : somador_um_bit port map (A(3), B(3), C_2, Soma(3), C_3);
    bit_5 : somador_um_bit port map (A(4), B(4), C_3, Soma(4), C_4);
    bit_6 : somador_um_bit port map (A(5), B(5), C_4, Soma(5), C_5);
    bit_7 : somador_um_bit port map (A(6), B(6), C_5, Soma(6), C_6);
    bit_8 : somador_um_bit port map (A(7), B(7), C_6, Soma(7), Vai_um);

end comportamento;